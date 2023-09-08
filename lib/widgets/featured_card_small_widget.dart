
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_color.dart';
import '../models/featured.dart';

class FeaturedCardSmallWidget extends StatelessWidget {
  final Featured featured;
  const FeaturedCardSmallWidget({
    super.key, required this.featured,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 160,
          height: 180,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(featured.image),
                  fit: BoxFit.cover
              ),
              borderRadius: const BorderRadius.all(Radius.circular(16.0))
          ),
          child: Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              'assets/icon_svg/heart.svg',
              height: 30,
              width: 30,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Text(
            featured.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontFamily: 'Recoleta',
                fontSize: 20,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(featured.avatar)
                    )
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          featured.nameUser,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: const TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          featured.likeCount.toString(),
                          style: const TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyShuttle
                          ),
                        ),
                        const SizedBox(width: 5.0,),
                        const Text(
                          'Reviews',
                          style: TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyShuttle
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
