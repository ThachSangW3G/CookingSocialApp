import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/featured.dart';
import 'package:cooking_social_app/models/follow_model.dart';
import 'package:cooking_social_app/models/user_model.dart';
import 'package:cooking_social_app/remote/recipe_firestore_sevice.dart';
import 'package:cooking_social_app/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/recipe.dart';
import '../remote/follow_firestore_service.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> getAllRecipes();
  Future<Recipe> getRecipe(String idRecipe);
  Future<List<Recipe>> getListRecipeByListID(List idRecipes, String idUserOwner);
  Future<void> updateAddRecipe(Recipe recipe);
  Future<void> updateRemoveRecipe(Recipe recipe);
  Future<List<Recipe>> getListRecipesByIdUser(String idUser);
}

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeFirestoreService _recipeFirestoreService;
  final FollowFirestoreService _followFirestoreService;

  RecipeRepositoryImpl({RecipeFirestoreService? recipeFirestoreService, FollowFirestoreService? followFirestoreService})
      : _recipeFirestoreService =
            recipeFirestoreService ?? RecipeFirestoreService(), _followFirestoreService = followFirestoreService ?? FollowFirestoreService();

  @override
  Future<List<Recipe>> getAllRecipes() {
    return _recipeFirestoreService.getAllRecipes();
  }


  @override
  Future<Recipe> getRecipe(String idRecipe) {
    return _recipeFirestoreService.getRecipe(idRecipe);
  }

  @override
  Future<List<Recipe>> getListRecipeByListID(List idRecipes, String idUserOwner) async {
    List<Recipe> listRecipes = [];
    for (String idRecipe in idRecipes){
      final recipe = await _recipeFirestoreService.getRecipe(idRecipe);

      if(recipe.isPublic == true){
        listRecipes.add(recipe);
      }

      try{
        final FollowModel followModel = await _followFirestoreService.followExist(idUserOwner, FirebaseAuth.instance.currentUser!.uid);
        print(followModel);
        if (followModel != null && recipe.isPublic == false){
          listRecipes.add(recipe);
        }
      }catch(e){

      }


    }


    return Future.value(listRecipes);
  }



  @override
  Future<void> updateAddRecipe(Recipe recipe) {
    recipe.numberLike += 1;
    print(recipe.numberLike);
    return _recipeFirestoreService.updateRecipe(recipe);
  }

  @override
  Future<void> updateRemoveRecipe(Recipe recipe) {
    recipe.numberLike -= 1;
    print(recipe.numberLike);
    return _recipeFirestoreService.updateRecipe(recipe);
  }

  @override
  Future<List<Recipe>> getListRecipesByIdUser(String idUser) {
    return _recipeFirestoreService.getListRecipesByIdUser(idUser);
  }

}

