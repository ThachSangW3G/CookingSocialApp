import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_color.dart';
import '../models/recipe.dart';

class PopularRecipe extends StatelessWidget {
  final Recipe recipe;
  const PopularRecipe({
    super.key, required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.name,
                      style: const TextStyle(
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
                          recipe.numberView.toString(),
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
                        Text(
                          recipe.cookTime.toString(),
                          style: const TextStyle(
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
                        Text(
                          recipe.difficult,
                          style: const TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 14,
                              color: AppColors.greyShuttle),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 100,
                child: ClipRRect(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(16.0)),
                    child: CachedNetworkImage(
                        imageUrl: recipe.url,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.04),
                            ),
                          );
                        }
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
