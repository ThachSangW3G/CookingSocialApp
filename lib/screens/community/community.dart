import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/models/featured.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/featured_card_small_widget.dart';

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
          onPressed: (){},
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,

      ),

      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyIron
              )
            ),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      border: Border(right: BorderSide(
                          color: AppColors.greyIron
                      ))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),

                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icon_svg/equalizer.svg',
                          color: AppColors.greyBombay,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 15.0,),
                        const Text(
                          'Filter',
                          style: TextStyle(
                            fontFamily: 'CeraPro',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyShuttle
                          ),
                        )
                      ],
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
                            color: AppColors.yellowOrange
                          ),
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
                              color: AppColors.greyShuttle
                          ),
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
                              color: AppColors.greyShuttle
                          ),
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
                              color: AppColors.greyShuttle
                          ),
                        ),
                      ),Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Text(
                          'Appreciation',
                          style: TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyShuttle
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 320),
                itemCount: listFeatured.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return  FeaturedCardSmallWidget(featured: listFeatured[index],);
                }),
            ),
          )

        ],
      ),

    );
  }
}
