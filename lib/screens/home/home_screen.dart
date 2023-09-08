import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/models/category.dart';
import 'package:cooking_social_app/models/cookbook.dart';
import 'package:cooking_social_app/providers/category_provider.dart';
import 'package:cooking_social_app/providers/provider_authentication/recipe_provider.dart';
import 'package:cooking_social_app/repository/recipe_repository.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
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
  int pageCount = 3;
  int pageCurrent = 1;

  @override
  Widget build(BuildContext context) {
    final RecipeProvider recipeProvider = Provider.of<RecipeProvider>(context);
    final CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.whitePorcelain,
      body: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteGenerator.accountScreen);

                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/avatar.jpg'),
                                    fit: BoxFit.contain)),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi Nararaya',
                              style: TextStyle(
                                  fontFamily: 'CeraPro',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'Why are you cooking today?',
                              style: TextStyle(
                                  fontFamily: 'CeraPro',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
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
                    itemCount: cookBookList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteGenerator.detailCookbook);
                          },
                          child: CookBookWidget(
                            cookBook: cookBookList[index],
                          ));
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: cookBookList.length,
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
                  onRefresh:  () async {
                    context.read<RecipeProvider>().init();
                    },
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: recipeProvider.features.length,
                    itemBuilder: (context, index){
                      final featured =  recipeProvider.features[index];
                      return FeaturedCard(featured: featured);
                      },
                  ),
                ),
              
                // InkWell(
                //   onTap: () {
                //     Navigator.pushNamed(
                //         context, RouteGenerator.recipedetailScreen);
                //   },
                //   child: FeaturedCard(
                //     featured: listFeatured[0],
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //         context, RouteGenerator.recipedetailScreen);
                //   },
                //   child: FeaturedCard(
                //     featured: listFeatured[1],
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //     Navigator.pushNamed(
                //         context, RouteGenerator.recipedetailScreen);
                //   },
                //   child: FeaturedCard(
                //     featured: listFeatured[2],
                //   ),
                // ),
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
                  onRefresh: () async{
                    context.read<CategoryProvider>().init();
                  },
                  child: Container(
                    height: 130,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: categoryProvider.categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
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
}
