import 'package:cooking_social_app/repository/category_repository.dart';
import 'package:flutter/cupertino.dart';

import '../models/category.dart';

class CategoryProvider extends ChangeNotifier {
  late CategoryRepository _categoryRepository;

  List<Category> _categories = <Category>[];

  List<Category> get categories => _categories;

  CategoryProvider() {
    _categoryRepository = CategoryRepositoryImpl();
    init();
  }

  init() async {
    _categories = await _categoryRepository.getAllCategories();

    notifyListeners();
  }

  Category getOneCategoty(String id) {
    Category category = categories.firstWhere((category) => category.id == id,
        orElse: () => categories[0]);
    return category;
  }
}
