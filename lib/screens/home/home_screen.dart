import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/localization/app_localization.dart';
import 'package:cooking_social_app/models/category.dart';
import 'package:cooking_social_app/models/cookbook.dart';
import 'package:cooking_social_app/models/like_model.dart';
import 'package:cooking_social_app/models/notification_model.dart';
import 'package:cooking_social_app/models/user_model.dart';
import 'package:cooking_social_app/providers/category_provider.dart';
import 'package:cooking_social_app/providers/cookbook_provider.dart';
import 'package:cooking_social_app/providers/like_provider.dart';
import 'package:cooking_social_app/providers/notification_provider.dart';
import 'package:cooking_social_app/providers/provider_authentication/recipe_provider.dart';
import 'package:cooking_social_app/providers/user_provider.dart';
import 'package:cooking_social_app/repository/recipe_repository.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../blocs/blocs/authentication_bloc.dart';
import '../../blocs/events/authentication_event.dart';
import '../../models/featured.dart';
import '../../widgets/category_card.dart';
import '../../widgets/cookbook_widget.dart';
import '../../widgets/featured_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  int pageCurrent = 1;


  late Future<UserModel> _userModelFuture;
  @override
  void initState() {

    super.initState();
    _userModelFuture = Provider.of<UserProvider>(context, listen: false).getUser(FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    final RecipeProvider recipeProvider = Provider.of<RecipeProvider>(context);
    final CategoryProvider categoryProvider =
        Provider.of<CategoryProvider>(context);
    final CookbookProvider cookbookProvider =
        Provider.of<CookbookProvider>(context);

    final LikeProvider likeProvider = Provider.of<LikeProvider>(context);
    final NotificationProvider notificationProvider = Provider.of<NotificationProvider>(context);
    final UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);


    //final UserProvider userProvider = Provider.of<UserProvider>(context);

    //final userCurrent = await userProvider.getUser(FirebaseAuth.instance.currentUser!.uid);

    final user = FirebaseAuth.instance.currentUser!;

    int? pageCount = cookbookProvider.cookbooks.length;

    return Scaffold(
      backgroundColor: AppColors.whitePorcelain,
      body: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder<UserModel>(
                  future: _userModelFuture,
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else if (snapshot.hasError) {
                      // Hiển thị widget khi có lỗi xảy ra
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Hiển thị widget khi dữ liệu đã được tải thành công
                      final userCurrent = snapshot.data;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteGenerator.accountScreen,
                                  );
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: CachedNetworkImage(
                                      imageUrl: userCurrent!.avatar,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${context.localize('hi')} ${userCurrent!.name}',
                                    style: const TextStyle(
                                      fontFamily: 'CeraPro',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    context.localize('whatareyoucookingtoday?'),
                                    // 'whatareyoucookingtoday',
                                    style: const TextStyle(
                                      fontFamily: 'CeraPro',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(
                                  context, RouteGenerator.notificationScreen);},
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: const Icon(
                                Icons.notifications_outlined,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.localize('cookBooks'),
                      style: const TextStyle(
                          fontFamily: 'Recoleta',
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        Text(
                          pageCurrent.toString(),
                          style: const TextStyle(
                            fontFamily: 'CeraPro',
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          '/',
                          style: TextStyle(
                            fontFamily: 'CeraPro',
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          cookbookProvider.cookbooks.length > 3 ? 3.toString() : cookbookProvider.cookbooks.length.toString(),
                          style: const TextStyle(
                            fontFamily: 'CeraPro',
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  // color: AppColors.whitePorcelain,
                  height: 500,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        pageCurrent = index + 1;
                      });
                    },
                    controller: _pageController,
                    itemCount: cookbookProvider.cookbooks.length > 3 ? 3 : cookbookProvider.cookbooks.length,
                    itemBuilder: (context, index) {
                      final cookbook = cookbookProvider.cookbooks[index];
                      //print(cookbook);
                      return InkWell(
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context, RouteGenerator.detailCookbook, arguments: CookBook(id: cookbook.id, title: cookbook.title, description: cookbook.description, likes: cookbook.likes, recipes: cookbook.recipes, image: cookbook.image, popularRecipeIndex: cookbook.popularRecipeIndex));
                            Navigator.of(context).pushNamed(
                                RouteGenerator.detailCookbook,
                                arguments: cookbook);
                          },
                          child: CookBookWidget(
                            cookBook: cookbook,
                          ));
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: cookbookProvider.cookbooks.length,
                  effect: const SwapEffect(
                      activeDotColor: AppColors.orangeCrusta,
                      dotWidth: 10,
                      dotHeight: 10),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.localize('featuredCommunityRecipes'),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontFamily: 'Recoleta',
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        context.localize('getLotsOfRecipeInspirationFromTheCommunity'),
                        style: const TextStyle(
                            fontFamily: 'CeraPro',
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                RefreshIndicator(
                  onRefresh: () async {
                    context.read<RecipeProvider>().init();
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: recipeProvider.features.length,
                    itemBuilder: (context, index) {
                      final featured = recipeProvider.features[index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                RouteGenerator.recipedetailScreen,
                                arguments: featured.id);
                          },
                          child: FutureBuilder<LikeModel>(
                              future: likeProvider.likeExist(featured.id, user.uid),
                              builder: (context, snapshot){
                                final LikeModel? liked = snapshot.data;

                                return FeaturedCard(featured: featured, like: (){

                                  if(liked == null){
                                    LikeModel likeModel = LikeModel(
                                        id: DateTime.now().toIso8601String(),
                                        idRecipe: featured.id,
                                        idUser: user.uid,
                                        time: Timestamp.now()
                                    );
                                    likeProvider.addLike(likeModel);

                                    recipeProvider.updateAddLikeByFeature(featured.id);

                                    NotificationModel notification = NotificationModel(
                                        id: DateTime.now().toIso8601String(),
                                        idUserGuest: user.uid,
                                        idUserOwner: featured.idUser,
                                        time: Timestamp.now(),
                                        type: 'liked',
                                        read: false,
                                        title: "",
                                        idRecipe: featured.id
                                    );

                                    notificationProvider.addNotification(notification);

                                  }else {
                                    likeProvider.deleteLike(liked);
                                    recipeProvider.updateRemoveLikeByFeature(featured.id);
                                  }

                                }, liked: liked != null,
                                  viewProfile: (){
                                    Navigator.of(context).pushNamed(
                                        RouteGenerator.accountpersonScreen,
                                        arguments: featured.idUser
                                    );
                                  },
                                );
                              }
                          ));
                    },
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),
                //     Navigator.pushNamed(
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteGenerator.community);
                  },
                  child:  Text(                    
                    context.localize('showAllRecipebyCommunity'),
                    style: const TextStyle(
                        fontFamily: 'CeraPro',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.orangeCrusta),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Category',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Recoleta',
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                RefreshIndicator(
                  onRefresh: () async {
                    context.read<CategoryProvider>().init();
                  },
                  child: Container(
                    height: 130,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: categoryProvider.categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = categoryProvider.categories[index];
                        return GestureDetector(
                          onTap: (){
                            recipeProvider.eventFilterKey(category.id);
                            Navigator.pushNamed(context, RouteGenerator.community);
                          },
                          child: CategoryCard(
                            category: category,
                            select: false,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  void getUser() {}
}
