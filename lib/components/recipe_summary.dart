import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/components/comment_item.dart';
import 'package:cooking_social_app/components/comment_item_not_option.dart';
import 'package:cooking_social_app/components/icon_content_orange.dart';
import 'package:cooking_social_app/components/line_row.dart';
import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:cooking_social_app/models/like_model.dart';
import 'package:cooking_social_app/models/review.dart';
import 'package:cooking_social_app/providers/cookbook_provider.dart';
import 'package:cooking_social_app/providers/like_provider.dart';
import 'package:cooking_social_app/providers/provider_recipe/recipe_state.dart';
import 'package:cooking_social_app/providers/provider_recipe/review_state.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:cooking_social_app/widgets/option_add_to_cookbook.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cooking_social_app/models/recipe.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RecipeSummary extends StatefulWidget {
  const RecipeSummary({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;
  @override
  State<RecipeSummary> createState() => _RecipeSummaryState();
}

class _RecipeSummaryState extends State<RecipeSummary> {
  Recipe? recipeGet;
  bool check = false;
  bool first = true;

  @override
  void initState() {
    recipeGet = widget.recipe;
    //context.read<ReviewStateProvider>().fetchReview(recipe!.key);
    // _getLikeData();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   //context.read<ReviewStateProvider>().fetchReview(recipe!.key);
  //   super.didChangeDependencies();
  // }
  // _getLikeData() async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('recipelike')
  //       .where('keyRecipe', isEqualTo: recipe!.key)
  //       .get();
  //   for (var element in snapshot.docs) {
  //     if (element['uidUser'] == FirebaseAuth.instance.currentUser?.uid) {
  //       check = true;
  //       break;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final LikeProvider likeProvider =
        Provider.of<LikeProvider>(context, listen: false);
    final ReviewStateProvider reviewProvider =
        Provider.of<ReviewStateProvider>(context, listen: false);

    final cookbookProvider = Provider.of<CookbookProvider>(context);
    // final RecipeStateProvider recipeProvider =
    //     Provider.of<RecipeStateProvider>(context);
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    // return FutureBuilder(
    //     future: recipeProvider.fetchRecipe(recipeGet!.key),
    //     builder: (context, snapchot) {
    final recipe = widget.recipe;
    // return recipe == null
    //     ? const Center(child: CircularProgressIndicator())
    return Container(
      width: double.infinity,
      color: AppColors.whitePorcelain,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            color: AppColors.whitePorcelain,
          ),
          Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: CachedNetworkImageProvider(recipe.url),
                fit: BoxFit.cover,
              )),
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).popUntil((route) =>
                            //     route.settings.name == '/detailCookbook');
                            // Navigator.popUntil(context,
                            //     ModalRoute.withName('/detailCookbook'));
                            // Navigator.popUntil(
                            //     context, (route) => route.isFirst);
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
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
                        FutureBuilder<LikeModel>(
                            future: likeProvider.likeExist(recipe.key, uid!),
                            builder: (context, snapshot) {
                              final LikeModel? liked = snapshot.data;
                              if (liked != null && first) {
                                check = true;
                                first = false;
                              }
                              return GestureDetector(
                                onTap: () async {
                                  if (!check) {
                                    setState(() {
                                      check = true;
                                      LikeModel likeModel = LikeModel(
                                          id: DateTime.now().toIso8601String(),
                                          idRecipe: recipe.key,
                                          idUser: uid,
                                          time: Timestamp.now());
                                      likeProvider.addLike(likeModel);
                                    });
                                    // Thêm dữ liệu vào Firestore
                                    // await FirebaseFirestore.instance
                                    //     .collection('recipelike')
                                    //     .add({
                                    //   'uidUser': FirebaseAuth
                                    //       .instance.currentUser?.uid,
                                    //   'keyRecipe': recipe!.key,
                                    //   // Thêm các trường dữ liệu khác của bạn nếu cần
                                    // });
                                  } else {
                                    await likeProvider.deleteLike(liked!);
                                    setState(() {
                                      check = false;
                                    });
                                    // QuerySnapshot snapshot =
                                    //     await FirebaseFirestore
                                    //         .instance
                                    //         .collection('recipelike')
                                    //         .where('keyRecipe',
                                    //             isEqualTo: recipe!.key)
                                    //         .get();
                                    // // Xóa dữ liệu khỏi Firestore
                                    // for (var element in snapshot.docs) {
                                    //   if (element['uidUser'] ==
                                    //       FirebaseAuth
                                    //           .instance.currentUser?.uid) {
                                    //     await element.reference.delete();
                                    //   }
                                    // }
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle),
                                  child: check == false
                                      ? Center(
                                          child: SvgPicture.asset(
                                            'assets/icon_svg/heart.svg',
                                            colorFilter: const ColorFilter.mode(
                                                AppColors.orangeCrusta,
                                                BlendMode.srcIn),
                                            height: 24,
                                            width: 24,
                                          ),
                                        )
                                      : Center(
                                          child: SvgPicture.asset(
                                            'assets/icon_svg/heart_orange.svg',
                                            colorFilter: const ColorFilter.mode(
                                                AppColors.orangeCrusta,
                                                BlendMode.srcIn),
                                            height: 24,
                                            width: 24,
                                          ),
                                        ),
                                ),
                              );
                            })
                      ]))),
          Container(
              margin: const EdgeInsets.only(top: 290),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: AppColors.white,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: AppColors.whitePorcelain,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Expanded(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'Cookbooks',
                                                          style:
                                                              kLabelTextStyle,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Text(
                                                          ' / ',
                                                          style:
                                                              kLabelTextStyle,
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            'Menu ayamkk scial',
                                                            style:
                                                                kLabelTextStyle,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10),
                                                    child: GestureDetector(
                                                      onTap: () {

                                                        cookbookProvider.setListCookbookOption(FirebaseAuth.instance.currentUser!.uid);
                                                        _showOptionAddToCookbook(context);

                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            7)),
                                                            color:
                                                                AppColors.white,
                                                            shape: BoxShape
                                                                .rectangle),
                                                        child: Center(
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icon_svg/plus.svg',
                                                            colorFilter:
                                                                const ColorFilter
                                                                    .mode(
                                                                    AppColors
                                                                        .black,
                                                                    BlendMode
                                                                        .srcIn),
                                                            height: 20,
                                                            width: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          recipe.name,
                                          style: const TextStyle(
                                            fontFamily: 'Recoleta',
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icon_svg/heart.svg',
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      AppColors.orangeCrusta,
                                                      BlendMode.srcIn),
                                              height: 15,
                                              width: 15,
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              recipe.numberLike.toString(),
                                              style: const TextStyle(
                                                  fontFamily: 'CeraPro',
                                                  color: AppColors.greyShuttle),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            const Text(
                                              '|',
                                              style: TextStyle(
                                                  fontFamily: 'CeraPro',
                                                  color: AppColors.greyShuttle),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              recipe.numberReView.toString(),
                                              style: const TextStyle(
                                                  fontFamily: 'CeraPro',
                                                  color: AppColors.greyShuttle),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            const Text(
                                              'Reviews',
                                              style: TextStyle(
                                                  fontFamily: 'CeraPro',
                                                  color: AppColors.greyShuttle),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        const LineRow(),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconContentOrange(
                                              label:
                                                  "${recipe.cookTime.toString()} min",
                                              iconData:
                                                  'assets/icon_svg/clock.svg',
                                            ),
                                            Container(
                                              width: 1.0,
                                              height: 40,
                                              color: AppColors.greyBombay,
                                            ),
                                            IconContentOrange(
                                              label: recipe.difficult,
                                              iconData:
                                                  'assets/icon_svg/dinner.svg',
                                            ),
                                            Container(
                                              width: 1.0,
                                              height: 40,
                                              color: AppColors.greyBombay,
                                            ),
                                            IconContentOrange(
                                              label:
                                                  'Serves ${recipe.serves.toString()}',
                                              iconData:
                                                  'assets/icon_svg/restaurant.svg',
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'Reviews (',
                                            style: kReviewLabelTextStyleBold,
                                          ),
                                          Text(recipe.numberReView.toString(),
                                              style: kReviewLabelTextStyleBold),
                                          const Text(
                                            ')',
                                            style: kReviewLabelTextStyleBold,
                                          )
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              RouteGenerator.reviewScreen,
                                              arguments: recipe);
                                        },
                                        child: const Text(
                                          'READ ALL',
                                          style: TextStyle(
                                              fontFamily: 'CeraPro',
                                              color: AppColors.orangeCrusta),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FutureBuilder<List<Review>>(
                                      future: reviewProvider
                                          .fetchReview(recipe.key),
                                      builder: (context, snapshotReview) {
                                        try {
                                          if (snapshotReview.hasError) {
                                            // Hiển thị widget khi có lỗi xảy ra
                                            return const Center(
                                              child: Text(
                                                "Don't have review",
                                                style: kReviewLabelTextStyle,
                                              ),
                                            );
                                          } else {
                                            final review = snapshotReview.data;
                                            return review == null
                                                ? const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : CommentItemNotOption(
                                                    review: review[0],
                                                  );
                                          }
                                        } catch (e) {
                                          return const Center(
                                            child: Text(
                                              "Don't have review",
                                              style: kReviewLabelTextStyle,
                                            ),
                                          );
                                        }
                                      })
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ])),
        ],
      ),
    );
    //});
  }

  _showOptionAddToCookbook(BuildContext context){
    showDialog(context: context,
      builder: (context){
        return OptionAddToCookbook(recipe: widget.recipe,);
      }
    );
  }
}
