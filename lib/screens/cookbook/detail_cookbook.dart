import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/models/cookbook.dart';
import 'package:cooking_social_app/models/recipe_item_published.dart';
import 'package:cooking_social_app/models/recipe_item_unpublished.dart';
import 'package:cooking_social_app/widgets/recipe_item_unpublished_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/recipe_item_published_widget.dart';

class DetailCookBookScreen extends StatefulWidget {
  const DetailCookBookScreen({super.key});

  @override
  State<DetailCookBookScreen> createState() => _DetailCookBookScreenState();
}

class _DetailCookBookScreenState extends State<DetailCookBookScreen> {
  @override
  Widget build(BuildContext context) {

    final Object? cookBook = ModalRoute.of(context)!.settings.arguments;
    //CookBook? cookBook = arguments as CookBook?;

    if (cookBook != null) {
      print(cookBook);
    } else {
      // Xử lý khi giá trị không hợp lệ (null hoặc không phải kiểu CookBook)
      print('null');
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background_1.jpg'),
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
                    Container(
                      height: 48,
                      width: 48,
                      decoration: const BoxDecoration(
                          color: AppColors.white, shape: BoxShape.circle),
                      child: Center(
                          child: Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/icons/pencil.png'),
                        )),
                      )),
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

                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'Menu ayam spesial',
                                style: TextStyle(
                                  fontFamily: 'Recoleta',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Keep it easy with these simple but delicious recipes.',
                                textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontFamily: 'CeraPro',
                                    fontSize: 16,
                                    color: AppColors.greyShuttle),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '4.8',
                                    style: TextStyle(
                                        fontFamily: 'CeraPro',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Ratings',
                                    style: TextStyle(
                                      fontFamily: 'CeraPro',
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '|',
                                    style: TextStyle(
                                        fontFamily: 'CeraPro',
                                        fontSize: 30,
                                        color: AppColors.greyIron),
                                  ),
                                  Text(
                                    '7',
                                    style: TextStyle(
                                      fontFamily: 'CeraPro',
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          border: Border.all(color: AppColors.greyIron)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Kari Daging Sapi',
                                  style: TextStyle(
                                    fontFamily: 'CeraPro',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icon_svg/heart.svg',
                                      color: AppColors.orangeCrusta,
                                      height: 15,
                                      width: 15,
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    const Text(
                                      '4.9',
                                      style: TextStyle(
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
                                    const Text(
                                      '103',
                                      style: TextStyle(
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
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icon_svg/clock.svg',
                                      height: 16,
                                      width: 16,
                                      color: AppColors.greyBombay,
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    const Text(
                                      '40',
                                      style: TextStyle(
                                          fontFamily: 'CeraPro',
                                          fontSize: 14,
                                          color: AppColors.greyShuttle),
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    const Text(
                                      'mins',
                                      style: TextStyle(
                                          fontFamily: 'CeraPro',
                                          fontSize: 14,
                                          color: AppColors.greyShuttle),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icon_svg/dinner.svg',
                                      height: 16,
                                      width: 16,
                                      color: AppColors.greyBombay,
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    const Text(
                                      'Easy',
                                      style: TextStyle(
                                          fontFamily: 'CeraPro',
                                          fontSize: 14,
                                          color: AppColors.greyShuttle),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/background_1.jpg'),
                                      fit: BoxFit.cover),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0))),
                            )
                          ],
                        ),
                      ),
                    ),
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
                        const Text(
                          'All Recipe (7)',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'Recoleta',
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        SvgPicture.asset(
                          'assets/icon_svg/sort-alpha-down.svg',
                          height: 24,
                          width: 24,
                          color: AppColors.greyBombay,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        RecipeItemPublishedWidget(
                          recipeItemPublished: RecipeItemPublished(
                              'Ayam Kecap Manis',
                              4.9,
                              109,
                              'assets/images/background_1.jpg'),
                        ),
                        RecipeItemPublishedWidget(
                          recipeItemPublished: RecipeItemPublished(
                              'Ayam Kecap Manis',
                              4.9,
                              109,
                              'assets/images/background_1.jpg'),
                        ),
                        RecipeItemPublishedWidget(
                          recipeItemPublished: RecipeItemPublished(
                              'Ayam Kecap Manis',
                              4.9,
                              109,
                              'assets/images/background_1.jpg'),
                        ),
                        RecipeItemUnPublishedWidget(
                            recipeItemUnPublished: RecipeItemUnPublished(
                                'Nasi Magelangan',
                                40,
                                'Easy',
                                'assets/images/background_splash_1.jpg')),
                        RecipeItemUnPublishedWidget(
                            recipeItemUnPublished: RecipeItemUnPublished(
                                'Nasi Magelangan',
                                40,
                                'Easy',
                                'assets/images/background_splash_1.jpg')),
                        RecipeItemUnPublishedWidget(
                            recipeItemUnPublished: RecipeItemUnPublished(
                                'Nasi Magelangan',
                                40,
                                'Easy',
                                'assets/images/background_splash_1.jpg')),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
