import 'package:cooking_social_app/components/ingredient_item.dart';
import 'package:cooking_social_app/models/recipe.dart';
import 'package:flutter/material.dart';

class TabContentSteps extends StatefulWidget {
  final Recipe? recipe;
  const TabContentSteps({Key? key, required this.recipe}) : super(key: key);

  @override
  State<TabContentSteps> createState() => _TabContentStepsState();
}

class _TabContentStepsState extends State<TabContentSteps> {
  List<String>? _steps;

  @override
  void initState() {
    _steps = widget.recipe?.steps;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cách nấu ăn',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'CeraPro',
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          // ListView(
          //   padding: const EdgeInsets.symmetric(horizontal: 12),
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   children: const [
          //     IngredientItemComponents(
          //         ingredientItem: '1 buah wortel, potong-potong'),
          //     IngredientItemComponents(ingredientItem: '5 potong sayap ayam'),
          //     IngredientItemComponents(
          //         ingredientItem: '1 buah wortel, potong-potong'),
          //     IngredientItemComponents(
          //         ingredientItem: '1 buah wortel, potong-potong'),
          //   ],
          // ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _steps!.length,
            itemBuilder: (context, index) {
              return IngredientItemComponents(ingredientItem: _steps![index]);
            },
          ),
        ],
      ),
    );
  }
}
