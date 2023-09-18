import 'package:cooking_social_app/components/ingredient_item.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class AddGroceryScreen extends StatefulWidget {
  // final List<String> ingredients ;
  // const AddGroceryScreen({required Key key, ingredients, required this.ingredients}) : super(key: key);

  // final List<String>? _ingredients;

  const AddGroceryScreen({Key? key,}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _AddGroceryState();
}

class _AddGroceryState extends State<AddGroceryScreen> {
  List<String>? _ingredients = ["A", 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Grocery()",
          style: TextStyle(
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
              // Xử lý sự kiện khi người dùng nhấn vào nút
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
      body: Column(
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
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _ingredients!.length,
            itemBuilder: (context, index) {
              return IngredientItemComponents(ingredientItem: _ingredients![index]);
            },
          ),
          // IngredientItemComponents(ingredientItem: ingredientItem)

          
          // const TabContentIngredients(recipe: null,),
        ],
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
                Navigator.of(context).popUntil((route) => route.isFirst);
                
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
