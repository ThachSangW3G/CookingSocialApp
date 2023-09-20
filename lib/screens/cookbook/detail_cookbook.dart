import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/models/cookbook.dart';
import 'package:cooking_social_app/models/like_cookbook.dart';
import 'package:cooking_social_app/providers/like_cookbook_provider.dart';
import 'package:cooking_social_app/providers/provider_authentication/recipe_provider.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:cooking_social_app/widgets/popular_recipe.dart';
import 'package:cooking_social_app/widgets/recipe_item_unpublished_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


import '../../models/recipe_cookbook.dart';
import '../../widgets/recipe_item_published_widget.dart';

class DetailCookBookScreen extends StatefulWidget {
  final CookBook? cookbook;
  const DetailCookBookScreen({super.key, this.cookbook});

  @override
  State<DetailCookBookScreen> createState() => _DetailCookBookScreenState();
}

class _DetailCookBookScreenState extends State<DetailCookBookScreen> {
  bool isAbs = true;

  @override
  Widget build(BuildContext context) {

    final bool isOwner = widget.cookbook!.idUser == FirebaseAuth.instance.currentUser!.uid;

    final LikeCookbookProvider likeCookbookProvider = Provider.of<LikeCookbookProvider>(context);
    final cookbook = widget.cookbook!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(cookbook.image),
                      fit: BoxFit.cover)),
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: const BoxDecoration(
                            color: AppColors.white, shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.black,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    FutureBuilder<LikeCookbook>(
                      future: likeCookbookProvider.likeCookbookExists(cookbook.id, FirebaseAuth.instance.currentUser!.uid),
                      builder: (context, snapshot){

                        final likeCookbook = snapshot.data;

                        return GestureDetector(
                          onTap: (){
                            if(isOwner){
                              Navigator.pushNamed(context, RouteGenerator.addCookbookScreen);
                            }else {
                              if (likeCookbook == null){
                                LikeCookbook like = LikeCookbook(
                                  id: DateTime.now().toIso8601String(),
                                  idCookbook: cookbook.id,
                                  idUser: FirebaseAuth.instance.currentUser!.uid,
                                  time: Timestamp.now(),
                                );

                                likeCookbookProvider.addLikeCookbook(like);
                              }else {
                                likeCookbookProvider.deleteLikeCookbook(likeCookbook);
                              }
                            }
                          },
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: const BoxDecoration(
                                color: AppColors.white, shape: BoxShape.circle),
                            child: Center(
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  child: SvgPicture.asset(
                                    isOwner ? 'assets/icon_svg/pencil.svg' : likeCookbook == null ? 'assets/icon_svg/heart.svg' : 'assets/icon_svg/heart_orange.svg',
                                    height: 25,
                                    width: 25,
                                    color: likeCookbook == null ? AppColors.greyShuttle : AppColors.orangeCrusta,
                                  ),
                                )),
                          ),
                        );
                      }
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 200),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 190,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(
                                    0.5), // Màu và độ mờ của đổ bóng
                                spreadRadius:
                                    0.1, // Bán kính mở rộng của đổ bóng
                                blurRadius: 0.1, // Độ mờ của đổ bóng
                                offset: const Offset(0,
                                    1), // Vị trí của đổ bóng trong hệ tọa độ (x, y)
                              )
                            ]),

                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                cookbook.title,
                                style: const TextStyle(
                                  fontFamily: 'Recoleta',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                cookbook.description,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                    fontFamily: 'CeraPro',
                                    fontSize: 16,
                                    color: AppColors.greyShuttle),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    cookbook.likes.toString(),
                                    style: const TextStyle(
                                        fontFamily: 'CeraPro',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Text(
                                    'Likes',
                                    style: TextStyle(
                                      fontFamily: 'CeraPro',
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    '|',
                                    style: TextStyle(
                                        fontFamily: 'CeraPro',
                                        fontSize: 30,
                                        color: AppColors.greyIron),
                                  ),
                                  Text(
                                    cookbook.recipes.length.toString(),
                                    style: const TextStyle(
                                      fontFamily: 'CeraPro',
                                      fontSize: 18,
                                    ),
                                  ),
                                  const Text(
                                    'Recipes',
                                    style: TextStyle(
                                      fontFamily: 'CeraPro',
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 48,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        color: AppColors.greyIron),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Recipe Title, Ingredient',
                          hintStyle: const TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 17,
                              color: AppColors.greyShuttle),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icon_svg/search.svg',
                              height: 25,
                              width: 25,
                              color: AppColors.greyShuttle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Popular Recipe',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'Recoleta',
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Consumer<RecipeProvider>(
                    builder: (context, recipeProvider, _) {
                      return FutureBuilder(
                        future: recipeProvider.getRecipe(cookbook
                            .recipes[cookbook.popularRecipeIndex] as String),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox(
                                height: 150,
                                child:
                                    Center(child: CircularProgressIndicator()));
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            final recipe = snapshot.data;
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      RouteGenerator.recipedetailScreen,
                                      arguments: recipe.key);
                                },
                                child: PopularRecipe(recipe: recipe!));
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'All Recipe (${cookbook.recipes.length.toString()})',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontFamily: 'Recoleta',
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAbs = !isAbs;
                            });
                          },
                          child: SvgPicture.asset(
                            isAbs
                                ? 'assets/icon_svg/sort-alpha-down.svg'
                                : 'assets/icon_svg/sort-alpha-up.svg',
                            height: 24,
                            width: 24,
                            color: AppColors.greyBombay,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: Consumer<RecipeProvider>(
                      builder: (context, recipeProvider, _) {
                        return FutureBuilder<List<Recipe>>(
                          future: recipeProvider
                              .getListRecipeByListID(cookbook.recipes),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircularProgressIndicator(),
                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              final recipes = snapshot.data;
                              if (isAbs) {
                                recipes!
                                    .sort((a, b) => a.name.compareTo(b.name));
                              } else {
                                recipes!
                                    .sort((a, b) => b.name.compareTo(a.name));
                              }
                              return ListView.builder(
                                itemCount: recipes!.length,
                                itemBuilder: (context, index) {
                                  final Recipe recipe = recipes![index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          RouteGenerator.recipedetailScreen,
                                          arguments: recipe.key);
                                    },
                                    child: RecipeItemUnPublishedWidget(
                                        recipe: recipe),
                                  );
                                },
                              );
                            }
                          },
                        );
                      },
                      // child: ListView.builder(
                      //   itemCount: cookbook.recipes.length,
                      //   shrinkWrap: true,
                      //   scrollDirection: Axis.vertical,
                      //   itemBuilder: (context, index){
                      //
                      //   },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
