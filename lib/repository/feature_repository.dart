import 'package:cooking_social_app/models/user_model.dart';
import 'package:cooking_social_app/remote/recipe_firestore_sevice.dart';
import 'package:cooking_social_app/remote/user_firestore_service.dart';

import '../models/featured.dart';
import '../models/recipe_cookbook.dart';

abstract class FeatureRepository {
  Future<Featured> getFeature(Recipe recipe);
  Future<List<Featured>> getAllFeature(List<Recipe> recipes);
}

class FeatureRepositoryImpl implements FeatureRepository {
  final RecipeFirestoreService _recipeFirestoreService;
  final UserFirestoreService _userFirestoreService;

  FeatureRepositoryImpl(
      {RecipeFirestoreService? recipeFirestoreService,
      UserFirestoreService? userFirestoreService})
      : _userFirestoreService = userFirestoreService ?? UserFirestoreService(),
        _recipeFirestoreService =
            recipeFirestoreService ?? RecipeFirestoreService();

  @override
  Future<Featured> getFeature(Recipe recipe) {
    UserModel userModel =
        _userFirestoreService.getUser(recipe.uidUser) as UserModel;
    Featured featured = Featured(
        id: recipe.key,
        image: recipe.url,
        title: recipe.name,
        avatar: userModel.avatar,
        nameUser: userModel.name,
        likeCount: recipe.numberLike,
        reviewCount: recipe.numberView);

    return Future.value(featured);
  }

  @override
  Future<List<Featured>> getAllFeature(List<Recipe> recipes) async {
    //print(recipes.length);
    List<Recipe> listRecipe = (await _recipeFirestoreService.getAllRecipes());
    List<Featured> listFeature = [];
    //print(listRecipe.length);
    // listRecipe.map((recipe) {
    //   UserModel userModel = _userFirestoreService.getUser(recipe.uidUser) as UserModel;
    //   Featured featured =  Featured(id: recipe.key, image: recipe.url, title: recipe.name, avatar: userModel.avatar, nameUser: userModel.name, likeCount: recipe.numberLike, reviewCount: recipe.numberView);
    //   listFeature.add(featured);
    //   //print(listFeature.length);
    // });
    // // await listRecipe.map((recipe) {
    // //   UserModel userModel = _userFirestoreService.getUser(recipe.uidUser) as UserModel;
    // //   Featured featured =  Featured(id: recipe.key, image: recipe.url, title: recipe.name, avatar: userModel.avatar, nameUser: userModel.name, likeCount: recipe.numberLike, reviewCount: recipe.numberView);
    // //   listFeature.add(featured);
    // //
    // // });
    // //print(listFeature.length);

    for (var recipe in listRecipe) {
      UserModel userModel =
          await _userFirestoreService.getUser(recipe.uidUser) as UserModel;
      Featured featured = Featured(
        id: recipe.key,
        image: recipe.url,
        title: recipe.name,
        avatar: userModel.avatar,
        nameUser: userModel.name,
        likeCount: recipe.numberLike,
        reviewCount: recipe.numberView,
      );
      listFeature.add(featured);
      // print(listFeature.length);
    }

    return Future.value(listFeature);
  }
}
