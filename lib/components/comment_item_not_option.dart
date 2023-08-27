import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommentItemNotOption extends StatelessWidget {
  final String name;
  final String time;
  final String content;
  final bool check;
  const CommentItemNotOption(
      {super.key,
      required this.name,
      required this.time,
      required this.content,
      required this.check});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 33,
          width: 33,
          padding: const EdgeInsets.only(top: 5),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/avatar.jpg'),
                  fit: BoxFit.contain)),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                name,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "CeraPro",
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                time,
                style: kLabelTextStyle,
              ),
              Text(
                content,
                style: kReviewLabelTextStyle,
              )
            ],
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
                          AppColors.greyBombay, BlendMode.srcIn),
                      height: 24,
                      width: 24,
                    ),
                  )
                : GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icon_svg/heart_orange.svg',
                      colorFilter: const ColorFilter.mode(
                          AppColors.orangeCrusta, BlendMode.srcIn),
                      height: 24,
                      width: 24,
                    ),
                  ),
            const SizedBox(
              width: 10,
            ),
            // SvgPicture.asset(
            //   'assets/icon_svg/options.svg',
            //   colorFilter: const ColorFilter.mode(
            //       AppColors.greyBombay, BlendMode.srcIn),
            //   height: 24,
            //   width: 24,
            // ),
          ]),
        ),
      ],
    );
  }
}
