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
                  padding: const EdgeInsets.only(left: 10, top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: "CeraPro",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: check == false
                                          ? const Icon(
                                              Icons.favorite_border_outlined,
                                              color: AppColors.greyBombay,
                                              size: 30,
                                            )
                                          : const Icon(
                                              Icons.favorite_sharp,
                                              color: Colors.red,
                                              size: 30,
                                            )),
                                  SvgPicture.asset(
                                    'assets/icon_svg/options.svg',
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.greyBombay, BlendMode.srcIn),
                                    height: 24,
                                    width: 24,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
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
