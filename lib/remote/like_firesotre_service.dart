import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/like_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LikeDataService {
  Future<void> addLike(LikeModel likeModel);
  Future<LikeModel> likeExists(String idRecipe, String idUser);
  Future<void> deleteLike(LikeModel likeModel);
  Future<List<LikeModel>> getLikedRecipe();
  Future<int> getLikeCount(String idRecipe);
}

class LikeFirestoreService implements LikeDataService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference likes = FirebaseFirestore.instance.collection('likes');

  @override
  Future<void> addLike(LikeModel likeModel) async {
    DocumentSnapshot snapshot =
        await firestore.collection('recipes').doc(likeModel.idRecipe).get();
    int currentReviewCount = snapshot['numberLike'];
    // Cập nhật số lượng review của công thức
    DocumentReference recipeRef =
        firestore.collection('recipes').doc(likeModel.idRecipe);
    firestore.runTransaction((transaction) async {
      transaction.update(recipeRef, {'numberLike': currentReviewCount + 1});
    });
    return likes
        .doc(likeModel.id)
        .set(likeModel.toJson())
        .then((value) => print('liked add'));
  }

  @override
  Future<LikeModel> likeExists(String idRecipe, String idUser) async {
    return await likes
        .where('idRecipe', isEqualTo: idRecipe)
        .where('idUser', isEqualTo: idUser)
        .limit(1)
        .get()
        .then((value) => LikeModel.fromJson(
            value.docs.first.data() as Map<String, dynamic>));
  }

  @override
  Future<void> deleteLike(LikeModel likeModel) async {
    DocumentSnapshot snapshot =
        await firestore.collection('recipes').doc(likeModel.idRecipe).get();
    int currentReviewCount = snapshot['numberLike'];
    // Cập nhật số lượng review của công thức
    DocumentReference recipeRef =
        firestore.collection('recipes').doc(likeModel.idRecipe);
    firestore.runTransaction((transaction) async {
      transaction.update(recipeRef, {'numberLike': currentReviewCount - 1});
    });
    return likes
        .doc(likeModel.id)
        .delete()
        .then((value) => print('deleted like'));
  }

  @override
  Future<List<LikeModel>> getLikedRecipe() async {
    List<LikeModel> listLikedRecipe = [];
    await likes
        .where('idUser', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        listLikedRecipe
            .add(LikeModel.fromJson(doc.data() as Map<String, dynamic>));
      });
    });
    listLikedRecipe.sort((a, b) => a.time.compareTo(b.time));

    return Future.value(listLikedRecipe);
  }

  @override
  Future<int> getLikeCount(String idRecipe) async {
    List<LikeModel> listLikedRecipe = [];
    await likes
        .where('idRecipe', isEqualTo: idRecipe)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        listLikedRecipe
            .add(LikeModel.fromJson(doc.data() as Map<String, dynamic>));
      });
    });

    return Future.value(listLikedRecipe.length);
  }
}
