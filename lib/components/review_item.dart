import 'package:cooking_social_app/components/line_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_color.dart';
import '../constants/app_styles.dart';

class ReviewItem extends StatelessWidget {
  final String name;
  final String content;
  final bool check;
  const ReviewItem(
      {super.key,
      required this.name,
      required this.content,
      required this.check});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/avatar.jpg'),
                        fit: BoxFit.contain)),
              ),
              Expanded(
                child: Container(
                  //decoration: BoxDecoration(color: Colors.black),
                  padding: const EdgeInsets.only(left: 10, top: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                name,
                                style: const TextStyle(
                                    color: AppColors.greyShuttle,
                                    fontFamily: "CeraPro",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              child: Row(children: [
                                check == false
                                    ? GestureDetector(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                          'assets/icon_svg/heart.svg',
                                          colorFilter: const ColorFilter.mode(
                                              AppColors.greyBombay,
                                              BlendMode.srcIn),
                                          height: 24,
                                          width: 24,
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                          'assets/icon_svg/heart_orange.svg',
                                          colorFilter: const ColorFilter.mode(
                                              AppColors.orangeCrusta,
                                              BlendMode.srcIn),
                                          height: 24,
                                          width: 24,
                                        ),
                                      ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  'assets/icon_svg/options.svg',
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.greyBombay, BlendMode.srcIn),
                                  height: 24,
                                  width: 24,
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        content,
                        style: kReviewLabelTextStyle,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const LineRow()
      ],
    );
  }
}
