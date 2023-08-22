import 'package:cooking_social_app/constants/app_color.dart';
import 'package:flutter/material.dart';

import '../constants/app_styles.dart';

class IconContentOrange extends StatelessWidget {
  final String label;
  final String iconData;
  const IconContentOrange(
      {super.key, required this.label, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(iconData),
          color: AppColors.orangeCrusta,
          height: 20,
          width: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(label, style: kReviewLabelTextStyle)
      ],
    );
  }
}
