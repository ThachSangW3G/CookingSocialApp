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
        // ReviewItem(
        //     // name: 'Resep Masakan Lemang Ikan Mas',
        //     // content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     // check: true, 
        //     // recipeId: null,
        //   ),
        // ReviewItem(
        //     name: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     check: false),
        // ReviewItem(
        //     name: 'Resep Masakan Lemang Ikan Mas',
        //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     check: true),
        // ReviewItem(
        //     name: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     check: false),
        // ReviewItem(
        //     name: 'Resep Masakan Lemang Ikan Mas',
        //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     check: true),
        // ReviewItem(
        //     name: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     check: false),
        // ReviewItem(
        //     name: 'Resep Masakan Lemang Ikan Mas',
        //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     check: true),
        // ReviewItem(
        //     name: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     check: false),
        // ReviewItem(
        //     name: 'Resep Masakan Lemang Ikan Mas',
        //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     check: true),
        // ReviewItem(
        //     name: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     content: 'Resepnya menarik mesti dicoba nih, terima kasih bunda',
        //     check: false),
      ],
    );
  }
}
