import 'package:cooking_social_app/models/grocery.dart';
import 'package:cooking_social_app/repository/grocery_repository.dart';
import 'package:flutter/material.dart';

class GroceryProvider extends ChangeNotifier{
  late GroceryRepository _groceryRepository;

  GroceryProvider(){
    _groceryRepository = GroceryRepositoryImpl();
  }

  String idUser = "";

  String idRecipe = "";

  createGrogery(Grocery grocery) async {
    await _groceryRepository.createGrogery(grocery);

    notifyListeners();
  }

  selectUserId(String userId){
    idUser = userId;
    notifyListeners();
  }

  selectRecipeId(String recipeId){
    idRecipe = recipeId;
    notifyListeners();
  }

  Future<List<Grocery>> getListGroceries() async {
    return await _groceryRepository.getListGroceries();
  }

  Future<void> deleteGrocery() async {
    await _groceryRepository.deleteGrocery();
    notifyListeners();
  }

}