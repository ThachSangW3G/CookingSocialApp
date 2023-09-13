import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/models/category.dart';
import 'package:cooking_social_app/models/cookbook.dart';
import 'package:cooking_social_app/models/user_model.dart';
import 'package:cooking_social_app/providers/category_provider.dart';
import 'package:cooking_social_app/providers/cookbook_provider.dart';
import 'package:cooking_social_app/providers/provider_authentication/recipe_provider.dart';
import 'package:cooking_social_app/providers/user_provider.dart';
import 'package:cooking_social_app/repository/recipe_repository.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    final RecipeProvider recipeProvider = Provider.of<RecipeProvider>(context);
    final CategoryProvider categoryProvider =
        Provider.of<CategoryProvider>(context);
    final CookbookProvider cookbookProvider =
        Provider.of<CookbookProvider>(context);
    //final UserProvider userProvider = Provider.of<UserProvider>(context);

    //final userCurrent = await userProvider.getUser(FirebaseAuth.instance.currentUser!.uid);
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
                Consumer<UserProvider>(
                  builder: (context, userProvider, _) {
                    return FutureBuilder<UserModel>(
                      future: userProvider
                          .getUser(FirebaseAuth.instance.currentUser!.uid),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
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
                                        'Hi ${userCurrent!.name}',
                                        style: const TextStyle(
                                          fontFamily: 'CeraPro',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Text(
                                        'Why are you cooking today?',
                                        style: TextStyle(
                                          fontFamily: 'CeraPro',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: const Icon(
                                  Icons.notifications_outlined,
                                  size: 30,
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Cookbooks',
                      style: TextStyle(
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
                          pageCount.toString(),
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
                  color: AppColors.whitePorcelain,
                  height: 500,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        pageCurrent = index + 1;
                      });
                    },
                    controller: _pageController,
                    itemCount: cookbookProvider.cookbooks.length,
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Featured Community Recipes',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Recoleta',
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Get lots of recipe inspiration from the community',
                        style: TextStyle(
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
                          child: FeaturedCard(featured: featured));
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
                  child: const Text(
                    'Show All Recipe by Community',
                    style: TextStyle(
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
                        return CategoryCard(
                          category: category,
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
