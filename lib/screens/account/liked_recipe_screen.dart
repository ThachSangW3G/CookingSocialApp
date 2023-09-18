import 'package:cooking_social_app/components/recipe_item.dart';
import 'package:cooking_social_app/models/recipe_cookbook.dart';
import 'package:cooking_social_app/widgets/recipe_item_unpublished_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/line_row.dart';
import '../../constants/app_color.dart';
import '../../providers/like_provider.dart';
import '../../routes/app_routes.dart';

class LikedRecipeScreen extends StatefulWidget {
  const LikedRecipeScreen({super.key});

  @override
  State<LikedRecipeScreen> createState() => _LikedRecipeScreenState();
}

class _LikedRecipeScreenState extends State<LikedRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    final LikeProvider likeProvider = Provider.of<LikeProvider>(context);
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
        body: FutureBuilder<List<Recipe>>(
          future: likeProvider.getLikedRecipe(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else {
              final listRecipe = snapshot.data;
              return ListView.builder(
                itemCount: listRecipe!.length,
                itemBuilder: (context, index){
                  final recipe = listRecipe[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed(
                          RouteGenerator.recipedetailScreen,
                          arguments: recipe.key);
                    },
                    child: RecipeItemUnPublishedWidget(
                      recipe: recipe,
                    ),
                  );
                },
              );
            }

          },
        )
    );
  }
}
