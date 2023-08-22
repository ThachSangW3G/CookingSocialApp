import 'package:cooking_social_app/components/recipe_item.dart';
import 'package:flutter/material.dart';

import '../../components/line_row.dart';
import '../../constants/app_color.dart';

class LikedRecipeScreen extends StatefulWidget {
  const LikedRecipeScreen({super.key});

  @override
  State<LikedRecipeScreen> createState() => _LikedRecipeScreenState();
}

class _LikedRecipeScreenState extends State<LikedRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whitePorcelain,
          centerTitle: true,
          title: const Text(
            'Liked Recipe',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Recoleta'),
          ),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
                size: 20,
              )),
        ),
        backgroundColor: AppColors.whitePorcelain,
        body: const Column(
          children: [
            LineRow(),
            RecipeItem(
                time: '40',
                name: 'Nguyen Trung Tinh, Nguyen Trung Tinh, Nguyen Trung Tinh')
            // ListView.builder(
            //     itemCount: 2,
            //     itemBuilder: (BuildContext context, int index) {
            //       return LikedWidget(time: '40', name: 'Nguyen Trung Tinh');
            //     }),
          ],
        ));
  }
}