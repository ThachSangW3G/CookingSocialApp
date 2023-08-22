import 'package:cooking_social_app/components/comment_item.dart';
import 'package:cooking_social_app/components/recipe_item.dart';
import 'package:flutter/material.dart';

import '../components/review_item.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({super.key});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        ReviewItem(
            name: 'Nguyen Trung Tinh',
            content: 'San Pham Rat Dep Luohhhhhhhhhhhhhhhhhhhhhhhhhhhhhn',
            check: false),
        ReviewItem(
            name: 'Nguyen Trung Tinh',
            content: 'San Pham Rat Dep Luohhhhhhhhhhhhhhhhhhhhhhhhhhhhhn',
            check: false),
        ReviewItem(
            name: 'Nguyen Trung Tinh',
            content: 'San Pham Rat Dep Luohhhhhhhhhhhhhhhhhhhhhhhhhhhhhn',
            check: false),
        ReviewItem(
            name: 'Nguyen Trung Tinh',
            content: 'San Pham Rat Dep Luohhhhhhhhhhhhhhhhhhhhhhhhhhhhhn',
            check: false),
      ],
    );
  }
}
