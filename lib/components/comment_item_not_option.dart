import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:cooking_social_app/models/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommentItemNotOption extends StatefulWidget {
  final Review review;
  const CommentItemNotOption({super.key, required this.review});

  @override
  State<CommentItemNotOption> createState() => _CommentItemNotOptionState();
}

class _CommentItemNotOptionState extends State<CommentItemNotOption> {
  Review? review;

  @override
  void initState() {
    review = widget.review;
    super.initState();
  }

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
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(review!.avatar), fit: BoxFit.fill)),
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
                review!.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "CeraPro",
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                review!.time,
                style: kLabelTextStyle,
              ),
              Text(
                review!.description,
                style: kReviewLabelTextStyle,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.zero,
          child: Row(children: [
            review!.check == false
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
