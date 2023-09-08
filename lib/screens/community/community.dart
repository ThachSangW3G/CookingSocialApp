import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/models/featured.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/category.dart';
import '../../widgets/category_card.dart';
import '../../widgets/featured_card_small_widget.dart';
import '../home/home_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comminity',
          style: TextStyle(
            fontFamily: 'Recoleta',
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: AppColors.greyIron)),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const OptionItemDialog();
                        });
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            right: BorderSide(color: AppColors.greyIron))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icon_svg/equalizer.svg',
                            color: AppColors.greyBombay,
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          const Text(
                            'Filter',
                            style: TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyShuttle),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15.0),
                  height: 20,
                  width: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Text(
                          'Relevancy',
                          style: TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.yellowOrange),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Text(
                          'Popular',
                          style: TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyShuttle),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Text(
                          'Commented',
                          style: TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyShuttle),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Text(
                          'Preparation Time',
                          style: TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyShuttle),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Text(
                          'Appreciation',
                          style: TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyShuttle),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 320),
                  itemCount: listFeatured.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return FeaturedCardSmallWidget(
                      featured: listFeatured[index],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class OptionItemDialog extends StatelessWidget {
  const OptionItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: SizedBox(
        height: 500,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: TextStyle(
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCard(
                      category: listCategory[0],
                    ),
                    CategoryCard(
                      category: listCategory[1],
                    ),
                    CategoryCard(
                      category: listCategory[2],
                    ),
                    CategoryCard(
                      category: listCategory[3],
                    ),
                    CategoryCard(
                      category: listCategory[4],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Sort',
                    style: TextStyle(
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Relevancy',
                    style: TextStyle(
                        fontFamily: 'CeraPro',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.yellowOrange),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                        fontFamily: 'CeraPro',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyShuttle),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Commented',
                    style: TextStyle(
                        fontFamily: 'CeraPro',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyShuttle),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Preparation Time',
                    style: TextStyle(
                        fontFamily: 'CeraPro',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyShuttle),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Appreciation',
                    style: TextStyle(
                        fontFamily: 'CeraPro',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyShuttle),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
