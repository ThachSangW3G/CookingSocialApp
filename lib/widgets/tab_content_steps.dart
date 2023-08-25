import 'package:cooking_social_app/components/ingredient_item.dart';
import 'package:flutter/material.dart';

class TabContentSteps extends StatelessWidget {
  const TabContentSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Bahan',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'CeraPro',
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              IngredientItemComponents(
                  ingredientItem: '1 buah wortel, potong-potong'),
              IngredientItemComponents(ingredientItem: '5 potong sayap ayam'),
              IngredientItemComponents(
                  ingredientItem: '1 buah wortel, potong-potong'),
              IngredientItemComponents(
                  ingredientItem: '1 buah wortel, potong-potong'),
            ],
          ),
        ],
      ),
    );
  }
}
