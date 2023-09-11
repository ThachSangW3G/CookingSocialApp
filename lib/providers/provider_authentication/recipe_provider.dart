
import 'package:cooking_social_app/repository/feature_repository.dart';
import 'package:cooking_social_app/repository/recipe_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../models/featured.dart';
import '../../models/recipe.dart';

class RecipeProvider extends ChangeNotifier{
  late RecipeRepository _recipeRepository;
  late FeatureRepository _featureRepository;

  List<Recipe> _recipes = <Recipe>[];

  List<Recipe> get recipes => _recipes;

  List<Featured> _features = <Featured>[];

  List<Featured> get features => _features;

  RecipeProvider(){
    _recipeRepository = RecipeRepositoryImpl();
    _featureRepository = FeatureRepositoryImpl();
    init();
  }

  init() async {
    _recipes = await _recipeRepository.getAllRecipes();
    //print(_recipes.length);
    _features = await _featureRepository.getAllFeature(_recipes);
    // print(_recipes.length);
    // print(_recipes.map((recipe) => recipe.name));
    notifyListeners();
  }


  Future<Recipe> getRecipe(String idRecipe) async {
    _recipeRepository = RecipeRepositoryImpl();
    Recipe recipe = await _recipeRepository.getRecipe(idRecipe);
    return recipe;
  }


  Future<List<Recipe>> getListRecipeByListID(List<dynamic> idRecipes){
    return _recipeRepository.getListRecipeByListID(idRecipes);
  }


}