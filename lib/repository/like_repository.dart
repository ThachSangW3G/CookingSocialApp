import 'package:cooking_social_app/models/like_model.dart';

import 'package:cooking_social_app/remote/like_firesotre_service.dart';

import '../models/recipe.dart';
import '../remote/recipe_firestore_sevice.dart';

abstract class LikeRepository {
  Future<void> addLike(LikeModel likeModel);
  Future<LikeModel> likeExists(String idRecipe, String idUser);
  Future<void> deleteLike(LikeModel likeModel);
  Future<List<Recipe>> getLikedRecipe();
  Future<int> getLikeCount(String idRecipe);
}

class LikeRepositoryImpl implements LikeRepository{
  final LikeFirestoreService _likeFirestoreService;
  final RecipeFirestoreService _recipeFirestoreService;

  LikeRepositoryImpl({LikeFirestoreService? likeFirestoreService, RecipeFirestoreService? recipeFirestoreService}) : _likeFirestoreService = likeFirestoreService ?? LikeFirestoreService(),
    _recipeFirestoreService = recipeFirestoreService ?? RecipeFirestoreService();

  @override
  Future<void> addLike(LikeModel likeModel) {
    return _likeFirestoreService.addLike(likeModel);
  }

  @override
  Future<LikeModel> likeExists(String idRecipe, String idUser) {
    return _likeFirestoreService.likeExists(idRecipe, idUser);
  }

  @override
  Future<void> deleteLike(LikeModel likeModel) {
    return _likeFirestoreService.deleteLike(likeModel);
  }

  @override
  Future<List<Recipe>> getLikedRecipe() async {
    List<LikeModel> listLikeRecipe = await _likeFirestoreService.getLikedRecipe();

    List<Recipe> recipes = [];

    for(var liked in listLikeRecipe){
      Recipe recipe = await _recipeFirestoreService.getRecipe(liked.idRecipe);

      recipes.add(recipe);
    }

    return Future.value(recipes);

  }

  @override
  Future<int> getLikeCount(String idRecipe) {
    return _likeFirestoreService.getLikeCount(idRecipe);
  }

}