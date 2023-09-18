import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/like_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LikeDataService{
  Future<void> addLike(LikeModel likeModel);
  Future<LikeModel> likeExists(String idRecipe, String idUser);
  Future<void> deleteLike(LikeModel likeModel);
  Future<List<LikeModel>> getLikedRecipe();
}

class LikeFirestoreService implements LikeDataService{

  CollectionReference likes = FirebaseFirestore.instance.collection('likes');

  @override
  Future<void> addLike(LikeModel likeModel) {
    return likes.doc(likeModel.id).set(likeModel.toJson()).then((value) => print('liked add'));
  }

  @override
  Future<LikeModel> likeExists(String idRecipe, String idUser) async {
    return await likes
        .where('idRecipe', isEqualTo: idRecipe)
        .where('idUser', isEqualTo: idUser)
        .limit(1)
        .get().then((value) => LikeModel.fromJson( value.docs.first.data() as Map<String, dynamic>));


  }

  @override
  Future<void> deleteLike(LikeModel likeModel) {
    return likes.doc(likeModel.id).delete().then((value) => print('deleted like'));
  }

  @override
  Future<List<LikeModel>> getLikedRecipe() async {
    List<LikeModel> listLikedRecipe = [];
    await likes.where('idUser', isEqualTo: FirebaseAuth.instance.currentUser!.uid).get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        listLikedRecipe.add(LikeModel.fromJson(doc.data() as Map<String, dynamic>));
      });
    });
    listLikedRecipe.sort((a, b) => a.time.compareTo(b.time));

    return Future.value(listLikedRecipe);
  }



}