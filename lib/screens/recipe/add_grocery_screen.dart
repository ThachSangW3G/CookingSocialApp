import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/components/ingredient_item.dart';
import 'package:cooking_social_app/models/grocery.dart';
import 'package:cooking_social_app/providers/grocery_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_color.dart';
import '../../models/recipe.dart';

class AddGroceryScreen extends StatefulWidget {
  final Recipe? recipe;

  const AddGroceryScreen({super.key, required this.recipe, });


  @override
  State<StatefulWidget> createState() => _AddGroceryState();
}

class _AddGroceryState extends State<AddGroceryScreen> {

  late Recipe recipe = widget.recipe!;

  late List<String> ingredients = [];


  @override
  Widget build(BuildContext context) {

    final groceryProvider = Provider.of<GroceryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Grocery(${recipe.material.length + recipe.spice.length})",
          style: const TextStyle(
              fontFamily: 'Recoleta',
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _showGobackPopup(context);
            // Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                ingredients.addAll(recipe.material);
                ingredients.addAll(recipe.spice);
              });

              final Grocery grocery = Grocery(
                key: DateTime.now().toIso8601String(),
                date: Timestamp.fromDate(DateTime.now()),
                ingredients: ingredients,
                recipeId: recipe.key,
                uidUser: FirebaseAuth.instance.currentUser!.uid
              );

              groceryProvider.createGrogery(grocery);

              Navigator.pop(context);

            },
            child: const Text(
              'Save',
              style: TextStyle(
                color: AppColors.orangeCrusta,
                fontSize: 16.0,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey, // Màu của đường gạch
                    width: 0.5, // Độ dày của đường gạch
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Add ingredients to grocery list. Tap ingredient to remove',
                style: TextStyle(
                    fontFamily: 'CeraPro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Divider(thickness: 0.5, indent: 16, endIndent: 16,),

            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Material',
                        style: TextStyle(
                            fontFamily: 'Recoleta',
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),

                SizedBox(



                  child: Column(
                    children:
                      recipe.material.map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: GestureDetector(child: IngredientItemComponents(ingredientItem: e),
                          onLongPress: (){
                            setState(() {
                              recipe.material.remove(e);
                            });
                          },
                        ),
                      )).toList()
                  )
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Spices',
                        style: TextStyle(
                            fontFamily: 'Recoleta',
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                

                  child: Column(
                    children: recipe.spice.map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: GestureDetector(child: IngredientItemComponents(ingredientItem: e,),
                        onLongPress: (){
                          setState(() {
                            recipe.spice.remove(e);
                          });
                        },
                      ),
                    )).toList(),
                  ),
                ),
              ],
            )



            // IngredientItemComponents(ingredientItem: ingredientItem)

            
            // const TabContentIngredients(recipe: null,),
          ],
        ),
      ),
    );
  }

  void _showGobackPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure you want to go back?'),
          content: const Text('Any changes you made will be lost.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                
                print('Go back successfully');
              },
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                print('Go back UNsuccessfully');

              },
              child: const Text('Cancle'),
            ),
          ],
        );
      },
    );
  }
}
