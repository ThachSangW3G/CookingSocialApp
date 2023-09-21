import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_social_app/models/cookbook.dart';

import 'package:cooking_social_app/models/recipe_item_unpublished.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_color.dart';

import '../models/recipe_cookbook.dart';
import '../models/recipe_item_published.dart';

class CookbookSmallWidget extends StatelessWidget {
  final CookBook cookBook;
  final bool selected;
  const CookbookSmallWidget({
    super.key,
    required this.cookBook, required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: const Border(bottom: BorderSide(color: AppColors.greyIron)
          ),
          color: selected ? AppColors.orange : AppColors.transparentColor,

        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  child: CachedNetworkImage(
                    imageUrl: cookBook.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cookBook.title,
                      style: const TextStyle(
                          fontFamily: 'CeraPro',
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
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
                                color: AppColors.orangeCrusta,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                cookBook.recipes.length.toString(),
                                style: const TextStyle(
                                  fontFamily: 'CeraPro',
                                  fontSize: 14,
                                  color: AppColors.greyShuttle,
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              const Text(
                                'mins',
                                style: TextStyle(
                                  fontFamily: 'CeraPro',
                                  fontSize: 14,
                                  color: AppColors.greyShuttle,
                                ),
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),

                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
