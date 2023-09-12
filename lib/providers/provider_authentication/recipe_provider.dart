
import 'package:cooking_social_app/repository/feature_repository.dart';
import 'package:cooking_social_app/repository/recipe_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../models/featured.dart';
import '../../models/recipe_cookbook.dart';

class RecipeProvider extends ChangeNotifier {
  late RecipeRepository _recipeRepository;
  late FeatureRepository _featureRepository;

  List<Recipe> _recipes = <Recipe>[];

  List<Recipe> get recipes => _recipes;

  List<Featured> _features = <Featured>[];

  List<Featured> get features => _features;

  List<Recipe> searchRecipe = [];
  String searchText = '';

  List<Featured> filterFeatured = [];
  List<String> filterKey = [];

  RecipeProvider() {
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

  updateSearch() async {
    if(searchText.isEmpty){
      searchRecipe = await _recipeRepository.getAllRecipes();
    }else {
      searchRecipe = _recipes.where((element) => element.name.toLowerCase().contains(searchText)).toList();

    }
    //print(searchRecipe![0].name);
    notifyListeners();
  }

  search(String search){
    searchText = search;
    updateSearch();
  }

  filterListFeatured(){

    if (filterKey.isEmpty) {
      filterFeatured = features;
    }else{
      filterFeatured = features.where((feature){
        return filterKey.contains(feature.category);
      }).toList();
    }


  }

  addFilterKey(String idCategory){
    filterKey.add(idCategory);
    notifyListeners();
  }

  removeFilterKey(String idCategory){
    filterKey.remove(idCategory);
    notifyListeners();
  }

  eventFilterKey(String idCategory){
    if (!filterKey.contains(idCategory)){
      addFilterKey(idCategory);
    }else{
      removeFilterKey(idCategory);
    }
    filterListFeatured();

    notifyListeners();
  }

  bool containsFilter(String idCategory){
    if(filterKey.contains(idCategory)){
      return true;
    }else{
      return false;
    }
  }


}
