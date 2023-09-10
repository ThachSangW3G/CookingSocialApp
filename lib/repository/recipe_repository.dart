import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/featured.dart';
import 'package:cooking_social_app/models/recipe.dart';
import 'package:cooking_social_app/models/user_model.dart';
import 'package:cooking_social_app/remote/recipe_firestore_sevice.dart';
import 'package:cooking_social_app/repository/user_repository.dart';

abstract class RecipeRepository{
  Future<List<Recipe>> getAllRecipes();
}

class RecipeRepositoryImpl implements RecipeRepository{

  final RecipeFirestoreService _recipeFirestoreService;

  RecipeRepositoryImpl({RecipeFirestoreService? recipeFirestoreService}): _recipeFirestoreService = recipeFirestoreService ??  RecipeFirestoreService();

  @override
  Future<List<Recipe>> getAllRecipes() {
    return _recipeFirestoreService.getAllRecipes();
  }

}