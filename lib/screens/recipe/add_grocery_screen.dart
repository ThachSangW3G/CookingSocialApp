import 'package:cooking_social_app/widgets/tab_content_ingredients.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class AddGroceryScreen extends StatefulWidget {
  const AddGroceryScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddGrocerySate();
}

class _AddGrocerySate extends State<AddGroceryScreen> {
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
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey, // Màu của đường gạch
                    width: 0.5, // Độ dày của đường gạch
                  ),
                ),
              ),
            ),
          ),
          const TabContentIngredients(),
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
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancle'),
            ),
          ],
        );
      },
    );
  }
}
