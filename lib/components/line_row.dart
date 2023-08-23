import 'package:cooking_social_app/constants/app_color.dart';
import 'package:flutter/material.dart';

class LineRow extends StatelessWidget {
  const LineRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1.4,
      color: AppColors.greyIron,
    );
  }
}
