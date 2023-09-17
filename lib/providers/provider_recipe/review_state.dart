import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/review.dart';
import 'package:cooking_social_app/services/date_time.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReviewStateProvider extends ChangeNotifier {
  List<Review> _review = [];
  List<Review> get review => _review;

  Future<List<Review>> fetchReview(String key) async {
    // try {
    List<Review> fetchedReview = [];
    //
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('reviews')
        .where('keyRecipe', isEqualTo: key)
        .get();
    for (var doc in snapshot.docs) {
      String uidUser = doc['uidUser'];
      String description = doc['description'];
      String key = doc['key'];
      Timestamp timestamp = doc['time'];
      String keyRecipe = doc['keyRecipe'];

      //
      DateTime dateTime = timestamp.toDate();

      // Sử dụng DateTime và timeago để hiển thị khoảng thời gian
      String timeAgo = calculateTimeAgo(dateTime);
      //
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uidUser)
          .get();

      String name = userSnapshot['name'];
      String avatar = userSnapshot['avatar'];
      //
      QuerySnapshot snapshotLike = await FirebaseFirestore.instance
          .collection('reviewlike')
          .where('keyReview', isEqualTo: key)
          .get();
      bool check = false;
      for (var docs in snapshotLike.docs) {
        if (docs['uidUser'] == FirebaseAuth.instance.currentUser?.uid) {
          check = true;
          break;
        }
      }
      Review review = Review(
          uidUser: uidUser,
          description: description,
          key: key,
          avatar: avatar,
          name: name,
          time: timeAgo,
          keyRecipe: keyRecipe,
          check: check);
      fetchedReview.add(review);
    }
    _review.clear();
    _review = fetchedReview;
    notifyListeners();
    //print(_review.length.toString() + "hddddddddddddddddd");
    return Future.value(_review);
    // } catch (e) {
    //   debugPrint(e as String?);
    // }
    // return null;
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
