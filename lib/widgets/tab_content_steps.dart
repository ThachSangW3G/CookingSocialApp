import 'package:cooking_social_app/components/ingredient_item.dart';
import 'package:flutter/material.dart';

class TabContentSteps extends StatelessWidget {
  const TabContentSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        IngredientItemComponents(ingredientItem: '1 buah wortel, potong-potong')
      ],
    );
  }
}
