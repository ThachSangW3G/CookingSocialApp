import 'package:cooking_social_app/models/category.dart';
import 'package:cooking_social_app/remote/category_firestore_service.dart';

abstract class CategoryRepository{
  Future<List<Category>> getAllCategories();
}

class CategoryRepositoryImpl implements CategoryRepository{

  final CategoryFirebaseService _categoryFirebaseService;

  CategoryRepositoryImpl({CategoryFirebaseService? categoryFirebaseService}) : _categoryFirebaseService = categoryFirebaseService ?? CategoryFirebaseService();

  @override
  Future<List<Category>> getAllCategories() {
    return _categoryFirebaseService.getAllCategories();
  }

}