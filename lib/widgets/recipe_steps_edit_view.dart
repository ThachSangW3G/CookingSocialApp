import 'package:cooking_social_app/widgets/step_edit_card.dart';
import 'package:flutter/material.dart';

class RecipeStepsEdit extends StatefulWidget {
  const RecipeStepsEdit({Key? key}) : super(key: key);

  @override
  State<RecipeStepsEdit> createState() => RecipeStepsEditState();
}

class RecipeStepsEditState extends State<RecipeStepsEdit> {
  List<String> steps = ['Cooking A', 'Cooking B', 'Cooking C', 'Cooking D'];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (newIndex > oldIndex) newIndex -= 1;
          final String step = steps.removeAt(oldIndex);
          steps.insert(newIndex, step);
        });
      },
      children: steps
          .asMap()
          .map((index, step) {
            return MapEntry(
              index,
              StepEditCard(
                key: ValueKey(index),
                step: step,
              ),
            );
          })
          .values
          .toList(),
    );
  }
}
