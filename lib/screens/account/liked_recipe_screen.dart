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
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
                size: 20,
              )),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(16.0), child: LineRow()),
        ),
        body: ListView(
          children: const [
            RecipeItem(
                time: '40',
                name: 'Resep Masakan Udang Tahu dengan Bumbu Tauco'),
            RecipeItem(
                time: '40',
                name: 'Resep Mie Sagu Khas Selat Panjang, Nikmatnya Menggoda')
          ],
        ));
  }
}
