import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/featured.dart';
import 'package:cooking_social_app/models/recipe_cookbook.dart';
import 'package:cooking_social_app/models/user_model.dart';
import 'package:cooking_social_app/remote/recipe_firestore_sevice.dart';
import 'package:cooking_social_app/repository/user_repository.dart';
import 'package:get/get.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> getAllRecipes();
  Future<Recipe> getRecipe(String idRecipe);
  Future<List<Recipe>> getListRecipeByListID(List<dynamic> idRecipes);
}

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeFirestoreService _recipeFirestoreService;

  RecipeRepositoryImpl({RecipeFirestoreService? recipeFirestoreService})
      : _recipeFirestoreService =
            recipeFirestoreService ?? RecipeFirestoreService();

  @override
  Future<List<Recipe>> getAllRecipes() {
    return _recipeFirestoreService.getAllRecipes();
  }


  @override
  Future<Recipe> getRecipe(String idRecipe) {
    return _recipeFirestoreService.getRecipe(idRecipe);
  }

  @override
  Future<List<Recipe>> getListRecipeByListID(List idRecipes) async {
    List<Recipe> listRecipes = [];
    for (String idRecipe in idRecipes){
      final recipe = await _recipeFirestoreService.getRecipe(idRecipe);
      listRecipes.add(recipe);
    }

    // if(isAbs){
    //   listRecipes.sort((a, b) => a.name.compareTo(b.name));
    // }else {
    //   listRecipes.sort((a, b) => b.name.compareTo(a.name));
    // }


    return Future.value(listRecipes);
  }

}

