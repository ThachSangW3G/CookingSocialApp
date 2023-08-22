import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'line_row.dart';
import '../constants/app_color.dart';

class RecipeItem extends StatelessWidget {
  final String time;
  final String name;
  const RecipeItem({super.key, required this.time, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/avatar.jpg'),
                        fit: BoxFit.contain)),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(name,
                          overflow: TextOverflow.visible,
                          style: kReviewLabelTextStyle),
                      Padding(
                        padding: const EdgeInsets.only(right: 50, top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/icon_svg/clock.svg',
                              height: 20,
                              width: 20,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.greyBombay, BlendMode.srcIn),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Text(
                              time,
                              style: kLabelTextStyle,
                            ),
                            const SizedBox(
                              width: 7.0,
                            ),
                            const Text(
                              'min',
                              style: kLabelTextStyle,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SvgPicture.asset(
                              'assets/icon_svg/dinner.svg',
                              height: 20,
                              width: 20,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.greyBombay, BlendMode.srcIn),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Text(
                              'Easy',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SvgPicture.asset(
                'assets/icon_svg/options.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.greyBombay, BlendMode.srcIn),
                height: 24,
                width: 24,
              )
            ],
          ),
        ),
        const LineRow(),
      ],
    );
  }
}
