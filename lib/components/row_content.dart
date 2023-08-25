import 'package:cooking_social_app/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RowContent extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const RowContent({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          const SizedBox(
            height: 23,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: "CeraPro",
                    color: Colors.black),
              ),
              SvgPicture.asset(
                'assets/icon_svg/chevron-circle-right.svg',
                height: 15,
                width: 8,
                colorFilter: const ColorFilter.mode(
                    AppColors.greyBombay, BlendMode.srcIn),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
