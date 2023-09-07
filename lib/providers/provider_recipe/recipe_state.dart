import 'package:flutter/cupertino.dart';
import 'package:cooking_social_app/models/recipe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeStateProvider extends ChangeNotifier {
  //get All recipe
  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  Future<void> fetchRecipe(String key) async {
    try {
      print(key);
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('recipes')
          .where('key', isEqualTo: key)
          .get();
      List<Recipe> fetchedRecipe = [];
      snapshot.docs.forEach((doc) {
        print('Document ID: ${doc.id}');
        print('Data: ${doc.data()}');
        fetchedRecipe.add(Recipe.fromJson(doc.data() as Map<String, dynamic>));
        print(fetchedRecipe[0].description);
      });

      _recipes = fetchedRecipe;
      print(_recipes[0].description);
      notifyListeners();
    } catch (e) {
      debugPrint(e as String?);
    }
  }

  Future<void> delete(Recipe recipe) async {
    try {
      // Xóa công thức từ cơ sở dữ liệu (ví dụ: Firestore)
      await FirebaseFirestore.instance
          .collection('recipes')
          .doc(recipe.key)
          .delete();

      // Cập nhật danh sách công thức sau khi xóa
      _recipes.remove(recipe);

      notifyListeners();
    } catch (error) {
      debugPrint(error as String?);
    }
  }

  Future<void> update(Recipe recipe) async {
    try {
      // Cập nhật công thức trong cơ sở dữ liệu (ví dụ: Firestore)
      await FirebaseFirestore.instance
          .collection('recipes')
          .doc(recipe.key)
          .update(recipe
              .toJson()); // Giả sử có phương thức toJson() để chuyển đổi thành Map

      // Cập nhật danh sách công thức sau khi cập nhật
      int index = _recipes.indexWhere((r) => r.key == recipe.key);
      if (index != -1) {
        _recipes[index] = recipe;
      }

      notifyListeners();
    } catch (error) {
      debugPrint(error as String?);
    }
  }
}
