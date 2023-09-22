import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/like_cookbook.dart';

abstract class LikeCookbookDataService {
  Future<void> addLikeCookbook(LikeCookbook likeCookbook);
  Future<void> deleteLikeCookbook(LikeCookbook likeCookbook);
  Future<LikeCookbook> likeCookbookExists(String idCookbook, String idUser);
}

class LikeCookbookFirestoreService implements LikeCookbookDataService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference likeCookbooks =
      FirebaseFirestore.instance.collection('likeCookbooks');

  @override
  Future<void> addLikeCookbook(LikeCookbook likeCookbook) async {
    DocumentSnapshot snapshot = await firestore
        .collection('cookbooks')
        .doc(likeCookbook.idCookbook)
        .get();
    int currentLikeCount = snapshot['likes'];
    // Cập nhật số lượng review của công thức
    DocumentReference recipeRef =
        firestore.collection('cookbooks').doc(likeCookbook.idCookbook);
    firestore.runTransaction((transaction) async {
      transaction.update(recipeRef, {'likes': currentLikeCount + 1});
    });
    return likeCookbooks
        .doc(likeCookbook.id)
        .set(likeCookbook.toJson())
        .then((value) => print('likedcookbook add'));
  }

  @override
  Future<void> deleteLikeCookbook(LikeCookbook likeCookbook) async {
    DocumentSnapshot snapshot = await firestore
        .collection('cookbooks')
        .doc(likeCookbook.idCookbook)
        .get();
    int currentLikeCount = snapshot['likes'];
    // Cập nhật số lượng review của công thức
    DocumentReference recipeRef =
        firestore.collection('cookbooks').doc(likeCookbook.idCookbook);
    firestore.runTransaction((transaction) async {
      transaction.update(recipeRef, {'likes': currentLikeCount - 1});
    });
    return likeCookbooks
        .doc(likeCookbook.id)
        .delete()
        .then((value) => print('deleted likecookbook'));
  }

  @override
  Future<LikeCookbook> likeCookbookExists(
      String idCookbook, String idUser) async {
    return await likeCookbooks
        .where('idCookbook', isEqualTo: idCookbook)
        .where('idUser', isEqualTo: idUser)
        .limit(1)
        .get()
        .then((value) => LikeCookbook.fromJson(
            value.docs.first.data() as Map<String, dynamic>));
  }
}
