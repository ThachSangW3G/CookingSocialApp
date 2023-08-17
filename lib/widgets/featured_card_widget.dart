import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../models/featured.dart';

class FeaturedCard extends StatelessWidget {
  final Featured featured;
  const FeaturedCard({
    super.key, required this.featured,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Container(
            width: 350,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(featured.image),
                    fit: BoxFit.cover
                ),
                borderRadius: const BorderRadius.all(Radius.circular(16.0))
            ),
          ),
          const SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              featured.title,
              style: const TextStyle(
                  fontFamily: 'Recoleta',
                  fontSize: 24,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
          const SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(featured.avatar),
                              fit: BoxFit.contain
                          )
                      ),

                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          featured.nameUser,
                          style: const TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/icons/heart_orange.png')
                                  )
                              ),
                            ),
                            const SizedBox(width: 10.0,),
                            Text(
                              featured.likeCount.toString(),
                              style: const TextStyle(
                                  fontFamily: 'CeraPro',
                                  fontSize: 14,
                                  color: AppColors.greyShuttle
                              ),
                            ),
                            const SizedBox(width: 10.0,),
                            const Text(
                              '·',
                              style: TextStyle(
                                  fontFamily: 'CeraPro',
                                  fontSize: 14,
                                  color: AppColors.greyShuttle

                              ),
                            ),
                            const SizedBox(width: 10.0,),
                            Text(
                              featured.reviewCount.toString(),
                              style: const TextStyle(
                                  fontFamily: 'CeraPro',
                                  fontSize: 14,
                                  color: AppColors.greyShuttle
                              ),
                            ),
                            const Text(
                              ' Reviews',
                              style: TextStyle(
                                  fontFamily: 'CeraPro',
                                  fontSize: 14,
                                  color: AppColors.greyShuttle
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),

                Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/heart_border_orange.png')
                      )
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}