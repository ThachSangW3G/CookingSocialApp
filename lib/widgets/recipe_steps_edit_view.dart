
import 'package:cooking_social_app/widgets/step_edit_card.dart';
import 'package:flutter/material.dart';

class RecipeStepsEdit extends StatefulWidget {
  const RecipeStepsEdit({super.key});

  @override
  State<RecipeStepsEdit> createState() => _RecipeStepsEditState();

}

class _RecipeStepsEditState extends State<RecipeStepsEdit>{
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        StepEditCard(step: 'Cooking A',),
        StepEditCard(step: 'Cooking B',),
        StepEditCard(step: 'Cooking c',),
        StepEditCard(step: 'Cooking D',),
        // Text('aaaaa'),
        // Text('dsefe')
      ],
    );
  }
}