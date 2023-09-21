import 'package:cooking_social_app/models/cookbook.dart';

import 'package:cooking_social_app/providers/cookbook_provider.dart';
import 'package:cooking_social_app/widgets/cookbook_small_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_color.dart';
import '../models/recipe.dart';

class OptionAddToCookbook extends StatefulWidget {
  final Recipe recipe;
  const OptionAddToCookbook({super.key, required this.recipe});

  @override
  State<OptionAddToCookbook> createState() => _OptionAddToCookbookState();
}

class _OptionAddToCookbookState extends State<OptionAddToCookbook> {


  int? selected;


  @override
  Widget build(BuildContext context) {
    final cookbookProvider = Provider.of<CookbookProvider>(context);
    return AlertDialog(
      title: const Text(
        'Add to cookbook',
        style: TextStyle(
          fontFamily: 'CeraPro',
        ),
      ),

      content: ListView.builder(
        itemCount: cookbookProvider.cookbookOptions.length,
        itemBuilder: (context, index){
          final cookbook = cookbookProvider.cookbookOptions[index];
          return GestureDetector(
              onTap: (){
                setState(() {
                  selected = index;
                });
              },
              child: CookbookSmallWidget(cookBook: cookbook,
                  selected: selected == index)

          );
        },
      ),
      actions: [
        TextButton(
          child: const Text('Cancel',
              style: TextStyle(
                  fontFamily: 'CeraPro', color: AppColors.orangeCrusta)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Add',
              style: TextStyle(
                  fontFamily: 'CeraPro', color: AppColors.orangeCrusta)),
          onPressed: () {

            if(selected == null){
              _showDialogNotice(context);
              return;
            }

            if(cookbookProvider.isCookbookContantsRecipe(cookbookProvider.cookbookOptions[selected!], widget.recipe.key)){
              _showDialogContantRecipe(context);
              return;
            }

            final cookbook = cookbookProvider.cookbookOptions[selected!];
            cookbook.recipes.add(widget.recipe.key);

            cookbookProvider.updateCookbook(cookbook);

            Navigator.pop(context);

          },
        ),
      ],

    );
  }
}

void _showDialogNotice(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Notice'),
        content: const Text('Please fill in all information!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancle',
                style: TextStyle(color: AppColors.orangeCrusta)),
          ),

        ],
      );
    },
  );
}

void _showDialogContantRecipe(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Notice'),
        content: const Text('Recipe already exists in the cookbook!!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancle',
                style: TextStyle(color: AppColors.orangeCrusta)),
          ),

        ],
      );
    },
  );
}
