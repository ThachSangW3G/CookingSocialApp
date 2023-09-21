// import 'package:cooking_social_app/models/grocery.dart';
// import 'package:cooking_social_app/repository/grocery_repository.dart';
// import 'package:flutter/material.dart';

// class GroceryProvider extends ChangeNotifier{
//   late GroceryRepository _groceryRepository;

//   GroceryProvider(){
//     _groceryRepository = GroceryRepositoryImpl();
//   }

//   String idUser = DateTime.now();

//   createGrogery(Grocery grocery) async {
//     await _groceryRepository.createGrogery(grocery);

//     notifyListeners();
//   }

//   selectDate(DateTime date){
//     dateSelected = date;
//     notifyListeners();
//   }

//   Future<List<RecipeCalendar>> getRecipeCalendar(DateTime date){
//     return _calendarRepository.getRecipeCalendar(date);
//   }

// }