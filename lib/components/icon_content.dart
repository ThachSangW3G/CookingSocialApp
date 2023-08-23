import 'package:flutter/material.dart';

import '../constants/app_styles.dart';

class IconContent extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  const IconContent(
      {super.key,
      required this.label,
      required this.iconData,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            iconData,
            size: 25,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(label, style: kLabelTextStyle)
        ],
      ),
    );
  }
}
