import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/review.dart';
import 'package:flutter/material.dart';

class ReviewStateProvider extends ChangeNotifier {
  List<Review> _review = [];
  List<Review> get review => _review;

  Future<void> fetchReview(String key) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('review')
          .where('keyRecipe', isEqualTo: key)
          .get();
      List<Review> fetchedRecipe = [];
      for (var doc in snapshot.docs) {
        fetchedRecipe.add(Review.fromJson(doc.data() as Map<String, dynamic>));
      }

      _review = fetchedRecipe;
      notifyListeners();
    } catch (e) {
      debugPrint(e as String?);
    }
  }

  Future<void> delete(Review review) async {
    try {
      // Xóa công thức từ cơ sở dữ liệu (ví dụ: Firestore)
      await FirebaseFirestore.instance
          .collection('reviews')
          .doc(review.key)
          .delete();

      // Cập nhật danh sách công thức sau khi xóa
      _review.remove(review);

      notifyListeners();
    } catch (error) {
      debugPrint(error as String?);
    }
  }

  Future<void> update(Review review) async {
    try {
      // Cập nhật công thức trong cơ sở dữ liệu (ví dụ: Firestore)
      await FirebaseFirestore.instance
          .collection('reviews')
          .doc(review.key)
          .update(review
              .toJson()); // Giả sử có phương thức toJson() để chuyển đổi thành Map

      // // Cập nhật danh sách công thức sau khi cập nhật
      // int index = _recipes.indexWhere((r) => r.key == recipe.key);
      // if (index != -1) {
      //   _recipes[index] = recipe;
      // }

      notifyListeners();
    } catch (error) {
      debugPrint(error as String?);
    }
  }
}
