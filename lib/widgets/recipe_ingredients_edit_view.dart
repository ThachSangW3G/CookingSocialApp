import 'package:cooking_social_app/widgets/ingredient_edit_card.dart';
import 'package:flutter/material.dart';

class RecipeIngredientsEdit extends StatefulWidget {
  const RecipeIngredientsEdit({Key? key}) : super(key: key);

  @override
  State<RecipeIngredientsEdit> createState() => RecipeIngredientsEditState();
}

class RecipeIngredientsEditState extends State<RecipeIngredientsEdit> {
  List<String> ingredients = [
    'Ingredients A',
    'Ingredients B',
    'Ingredients C',
    'Ingredients D',
    'Ingredients E',
    'Ingredients H'
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReorderableListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        // physics: const NeverScrollableScrollPhysics(),
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex -= 1;
            final String step = ingredients.removeAt(oldIndex);
            ingredients.insert(newIndex, step);
          });
        },
        children: ingredients
            .asMap()
            .map((index, step) {
              return MapEntry(
                index,
                IngredientEditCard(
                  key: ValueKey(index),
                  ingredient: step,
                ),
              );
            })
            .values
            .toList(),
      ),
    );
  }
}
