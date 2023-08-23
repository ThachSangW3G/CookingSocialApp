
import 'package:cooking_social_app/models/recipe_item_unpublished.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_color.dart';
import '../models/recipe_item_published.dart';

class RecipeItemUnPublishedWidget extends StatelessWidget {
  final RecipeItemUnPublished recipeItemUnPublished;
  const RecipeItemUnPublishedWidget({
    super.key, required this.recipeItemUnPublished,
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
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(recipeItemUnPublished.image),
                      fit: BoxFit.cover
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(16.0))
              ),
            ),
            const SizedBox(width: 10.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipeItemUnPublished.title,
                    style: const TextStyle(
                        fontFamily: 'CeraPro',
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icon_svg/clock.svg',
                              height: 16,
                              width: 16,
                              color: AppColors.greyBombay,
                            ),
                            const SizedBox(width: 10.0,),
                            Text(
                              recipeItemUnPublished.time.toString(),
                              style: const TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 14,
                                color: AppColors.greyShuttle,
                              ),
                            ),
                            const SizedBox(width: 8.0,),
                            const Text(
                              'mins',
                              style: TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 14,
                                color: AppColors.greyShuttle,
                              ),
                            ),
                            const SizedBox(width: 12.0,),
                            SvgPicture.asset(
                              'assets/icon_svg/dinner.svg',
                              height: 16,
                              width: 16,
                              color: AppColors.greyBombay,
                            ),
                            const SizedBox(width: 8.0,),
                            Text(
                              recipeItemUnPublished.level,
                              style: const TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 14,
                                color: AppColors.greyShuttle,
                              ),
                            ),

                          ],
                        ),
                      ),


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
