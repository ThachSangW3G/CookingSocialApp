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
      scrollDirection: Axis.vertical,
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
