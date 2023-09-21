
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_color.dart';

import '../models/recipe.dart';
import '../models/recipe_item_published.dart';

class RecipeSelect extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback select;
  final bool selected;
  const RecipeSelect({
    super.key, required this  .recipe, required this.select, required this.selected,
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
                              recipe.numberReView.toString(),
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


                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 0.0,),
            GestureDetector(
              onTap: select,
              child: SvgPicture.asset(
                selected ? 'assets/icon_svg/x-circle.svg' : 'assets/icon_svg/check-circle.svg',
                color: selected ? AppColors.red : AppColors.green,
                height: 30,
                width: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
