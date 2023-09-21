
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

  String _sort = 'relevancy';

  String get sort => _sort;

  List<int> selected = [];
  List<int> unSelected = [];

  RecipeProvider() {
    _recipeRepository = RecipeRepositoryImpl();
    _featureRepository = FeatureRepositoryImpl();

    init();
    initSelect();


  }

  init() async {
    _recipes = await _recipeRepository.getAllRecipes();
    //print(_recipes.length);
    _features = await _featureRepository.getAllFeature(_recipes);
    // print(_recipes.length);
    // print(_recipes.map((recipe) => recipe.name));

    initSelect();
    notifyListeners();
  }

  setSort(String strSort){
    _sort = strSort;
    filterListFeatured();
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

    switch (_sort){
      case 'relevancy':
        if (filterKey.isEmpty) {
          filterFeatured = features;
        }else{
          filterFeatured = features.where((feature){
            return filterKey.contains(feature.category);
          }).toList();
        }
        break;
      case 'popular':
        filterFeatured.sort((a, b) => b.likeCount.compareTo(a.likeCount));
        break;
      case 'commented':
        filterFeatured.sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
        break;
      case 'preparation_time':
        filterFeatured.sort((a, b) => b.cookTime.compareTo(a.cookTime));
    }

    print(_sort);

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


   initSelect(){
    selected = [];
    unSelected = List<int>.generate(recipes.length, (index) => index);

    print(selected);
    print(unSelected);

    notifyListeners();
  }

   addSelected(int index){
    selected.add(index);
    unSelected.remove(index);


    notifyListeners();
  }

   removeSelected(int index){
    unSelected.add(index);
    selected.remove(index);

    notifyListeners();
  }

  List<String> getIdRecipeSelected(){
    List<String> listId = [];
    for(var index in selected){
      listId.add(recipes[index].key);
    }

    return listId;
  }

  int getIndexRecipe(String idRecipe){
    return recipes.indexWhere((element) => element.key == idRecipe);
  }


  updateAddLike(Recipe recipe) async {
    _recipeRepository.updateAddRecipe(recipe);

    reloadData();
    notifyListeners();
  }

  updateAddLikeByFeature(String idRecipe) async {
    final Recipe recipe = await _recipeRepository.getRecipe(idRecipe);
    _recipeRepository.updateAddRecipe(recipe);

    reloadData();
    notifyListeners();
  }

  updateRemoveLike(Recipe recipe) async {
    _recipeRepository.updateRemoveRecipe(recipe);

    reloadData();
    notifyListeners();
  }

  updateRemoveLikeByFeature(String idRecipe) async {
    final Recipe recipe = await _recipeRepository.getRecipe(idRecipe);
    _recipeRepository.updateRemoveRecipe(recipe);

    reloadData();
    notifyListeners();
  }

  reloadData() async {
    _recipes = await _recipeRepository.getAllRecipes();
    _features = await _featureRepository.getAllFeature(_recipes);
    notifyListeners();
  }

  Future<List<Recipe>> getListRecipesByIdUser(String idUser){
    return _recipeRepository.getListRecipesByIdUser(idUser);
  }

  Future<List<Featured>> getListFeatureByIdUser(String idUser){
    return _featureRepository.getListFeatureByIdUser(idUser);
  }

}
