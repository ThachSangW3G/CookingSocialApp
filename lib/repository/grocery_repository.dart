import 'package:cooking_social_app/models/grocery.dart';
import 'package:cooking_social_app/remote/grocery_firestore_service.dart';

abstract class GroceryRepository {
  // Future<List<Grocery>> getAllRecipes();
  Future<void> createGrogery(Grocery grocery);
  Future<List<Grocery>> getListGroceries();
  Future<void> deleteGrocery();
}

class GroceryRepositoryImpl implements GroceryRepository{
  
  GroceryFireStoreService _groceryFireStoreService;
  
  GroceryRepositoryImpl({GroceryFireStoreService? groceryFireStoreService}) : _groceryFireStoreService = groceryFireStoreService ?? GroceryFireStoreService();

  @override
  Future<void> createGrogery(Grocery grocery) {
    return _groceryFireStoreService.createGrogery(grocery);
  }

  @override
  Future<List<Grocery>> getListGroceries() {
    return _groceryFireStoreService.getListGroceries();
  }

  @override
  Future<void> deleteGrocery() {
    return _groceryFireStoreService.deleteGrocery();
  }

}