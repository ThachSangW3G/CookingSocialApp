import 'package:cooking_social_app/widgets/ingredient_edit_card.dart';
import 'package:flutter/material.dart';

class RecipeIngredientsEdit extends StatefulWidget {
  const RecipeIngredientsEdit({super.key});

  @override
  State<RecipeIngredientsEdit> createState() => _RecipeIngredientsEditState();

}

class _RecipeIngredientsEditState extends State<RecipeIngredientsEdit>{
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        IngredientEditCard(ingredient: 'Noolde, potong-potong',),
        IngredientEditCard(ingredient: 'Recipe B, potong-potong',),
        IngredientEditCard(ingredient: 'Ca Chua, potong-potong',),
        IngredientEditCard(ingredient: 'Chicken, potong-potong',),
        // Text('aaaaa'),
        // Text('dsefe')
      ],
    );
  }
}