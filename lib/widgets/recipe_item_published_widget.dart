
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_color.dart';
import '../models/recipe_cookbook.dart';
import '../models/recipe_item_published.dart';

class RecipeItemPublishedWidget extends StatelessWidget {
  final Recipe recipe;
  const RecipeItemPublishedWidget({
    super.key, required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(
              color: AppColors.greyIron
          ))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                child: CachedNetworkImage(
                  imageUrl: recipe.url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: const TextStyle(
                        fontFamily: 'CeraPro',
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 0.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icon_svg/heart_orange.svg',
                              height: 16,
                              width: 16,

                            ),
                            const SizedBox(width: 5.0,),
                            Text(
                              recipe.numberLike.toString(),
                              style: const TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 14,
                                color: AppColors.greyShuttle,
                              ),
                            ),
                            const SizedBox(width: 5.0,),
                            const Text(
                              '|',
                              style: TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 14,
                                color: AppColors.greyShuttle,
                              ),
                            ),
                            const SizedBox(width: 5.0,),
                            Text(
                              recipe.numberView.toString(),
                              style: const TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 14,
                                color: AppColors.greyShuttle,
                              ),
                            ),
                            const SizedBox(width: 5.0,),
                            const Text(
                              'Reviews',
                              style: TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 14,
                                color: AppColors.greyShuttle,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: const BoxDecoration(
                            color: AppColors.bluePrussian,
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: const Center(
                          child: Text(
                            'Published',
                            style: TextStyle(
                                fontFamily: 'CeraPro',
                                color: AppColors.white,
                                fontSize: 12
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 0.0,),
            SvgPicture.asset(
              'assets/icon_svg/options.svg',
              color: AppColors.greyBombay,
              height: 24,
              width: 24,
            )
          ],
        ),
      ),
    );
  }
}
