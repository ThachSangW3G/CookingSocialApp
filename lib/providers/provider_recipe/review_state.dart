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
    _review = fetchedReview;
    //notifyListeners();
    //print(_review.length.toString() + "hddddddddddddddddd");
    print(_review[0].description);
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

  Future<void> addReview(String description, String keyRecipe) async {
    // Khởi tạo Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // Tạo một document reference và lấy ra ID ngẫu nhiên
    CollectionReference reviewRef = firestore.collection('reviews');
    // Tạo một map chứa thông tin review
    Map<String, dynamic> reviewData = {
      'uidUser':
          FirebaseAuth.instance.currentUser?.uid, // Giá trị uidUser (String)
      'time': Timestamp.now(), // Giá trị time (Timestamp)
      'key': DateTime.now().toIso8601String(), // Giá trị key (String)
      'keyRecipe': keyRecipe,
      'description': description
    };
    // Thêm review vào Firestore
    await reviewRef.doc(DateTime.now().toIso8601String()).set(reviewData);
    //Get so luong hien tai
    DocumentSnapshot snapshot =
        await firestore.collection('recipes').doc(keyRecipe).get();
    int currentReviewCount = snapshot['numberReview'];
    // Cập nhật số lượng review của công thức
    DocumentReference recipeRef =
        firestore.collection('recipes').doc(keyRecipe);
    firestore.runTransaction((transaction) async {
      transaction.update(recipeRef, {'numberReview': currentReviewCount + 1});
    });
    //
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    String name = userSnapshot['name'];
    String avatar = userSnapshot['avatar'];
    //
    DateTime dateTime = Timestamp.now().toDate();

    // Sử dụng DateTime và timeago để hiển thị khoảng thời gian
    String timeAgo = calculateTimeAgo(dateTime);
    Review review = Review(
        uidUser: FirebaseAuth.instance.currentUser!.uid,
        description: description,
        key: recipeRef.id,
        avatar: avatar,
        name: name,
        time: timeAgo,
        keyRecipe: keyRecipe,
        check: false);
    _review.add(review);
    notifyListeners();
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
