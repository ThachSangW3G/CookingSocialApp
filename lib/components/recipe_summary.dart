import 'package:cooking_social_app/components/comment_item.dart';
import 'package:cooking_social_app/components/icon_content_orange.dart';
import 'package:cooking_social_app/components/line_row.dart';
import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class RecipeSummary extends StatefulWidget {
  const RecipeSummary({super.key});

  @override
  State<RecipeSummary> createState() => _RecipeSummaryState();
}

class _RecipeSummaryState extends State<RecipeSummary> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Expanded(
          child: Container(
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
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/image_background.png'),
                          fit: BoxFit.fill)),
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
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
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                color: AppColors.white, shape: BoxShape.circle),
                            child: const Center(
                              child: Image(
                                image: AssetImage('assets/icons/heart.png'),
                                width: 23,
                                height: 23,
                                color: AppColors.orangeCrusta,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: AppColors.white,
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(7)),
                                                    color: AppColors.greyIron,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Expanded(
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  'Cookbooks',
                                                                  style:
                                                                      kLabelTextStyle,
                                                                ),
                                                                Text(
                                                                  ' / ',
                                                                  style:
                                                                      kLabelTextStyle,
                                                                ),
                                                                Text(
                                                                  'Menu ayam special',
                                                                  style:
                                                                      kLabelTextStyle,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        10),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {},
                                                              child: Container(
                                                                height: 30,
                                                                width: 30,
                                                                decoration: const BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            7)),
                                                                    color: AppColors
                                                                        .white,
                                                                    shape: BoxShape
                                                                        .rectangle),
                                                                child:
                                                                    const Center(
                                                                  child: Image(
                                                                    image: AssetImage(
                                                                        'assets/icons/plus.png'),
                                                                    width: 20,
                                                                    height: 20,
                                                                    color: Colors
                                                                        .black,
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
                                                const Text(
                                                  'Menu ayam spejjjjjjjjjjjjjjjjjjjjjjjjjsial',
                                                  style: TextStyle(
                                                    fontFamily: 'Recoleta',
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'assets/icons/heart.png'),
                                                      color: AppColors
                                                          .orangeCrusta,
                                                      height: 15,
                                                      width: 15,
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                      '4.9',
                                                      style: TextStyle(
                                                          fontFamily: 'CeraPro',
                                                          color: AppColors
                                                              .greyShuttle),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                      '|',
                                                      style: TextStyle(
                                                          fontFamily: 'CeraPro',
                                                          color: AppColors
                                                              .greyShuttle),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                      '103',
                                                      style: TextStyle(
                                                          fontFamily: 'CeraPro',
                                                          color: AppColors
                                                              .greyShuttle),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Text(
                                                      'Reviews',
                                                      style: TextStyle(
                                                          fontFamily: 'CeraPro',
                                                          color: AppColors
                                                              .greyShuttle),
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
                                                const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    IconContentOrange(
                                                      label: '40 min',
                                                      iconData:
                                                          'assets/icons/clock.png',
                                                    ),
                                                    VerticalDivider(
                                                      width: 10,
                                                      thickness: 1,
                                                      indent: 10,
                                                      endIndent: 0,
                                                      color: Colors.grey,
                                                    ),
                                                    IconContentOrange(
                                                      label: 'Easy',
                                                      iconData:
                                                          'assets/icons/tray.png',
                                                    ),
                                                    VerticalDivider(
                                                      width: 10,
                                                      thickness: 1,
                                                      indent: 10,
                                                      endIndent: 0,
                                                      color: Colors.grey,
                                                    ),
                                                    IconContentOrange(
                                                      label: 'Serves 2',
                                                      iconData:
                                                          'assets/icons/restaurant.png',
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: AppColors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Row(
                                          children: [
                                            Text(
                                              'Reviews (',
                                              style: kReviewLabelTextStyleBold,
                                            ),
                                            Text('67',
                                                style:
                                                    kReviewLabelTextStyleBold),
                                            Text(
                                              ')',
                                              style: kReviewLabelTextStyleBold,
                                            )
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                RouteGenerator.reviewScreen);
                                          },
                                          child: const Text(
                                            'READ ALL',
                                            style: TextStyle(
                                                color: AppColors.orangeCrusta),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const CommentItem(
                                      name: 'Nguyen Trung Tinh',
                                      time: '4 day ago',
                                      content: 'San pham rat dep a luon a',
                                      check: false)
                                ],
                              ),
                            ),
                          ))
                    ])),
              ],
            ),
          ),
        ));
  }
}
