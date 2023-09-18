import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/like_model.dart';
import 'package:cooking_social_app/models/like_review.dart';

abstract class LikeReviewService {
  Future<void> addLike(LikeReview likeModel);
  Future<LikeReview> likeExists(String idReview, String idUser);
  Future<void> deleteLike(LikeReview likeModel);
}

class LikeReviewFirestoreService implements LikeReviewService {
  CollectionReference likes =
      FirebaseFirestore.instance.collection('reviewlike');

  @override
  Future<void> addLike(LikeReview likeModel) {
    return likes
        .doc(likeModel.id)
        .set(likeModel.toJson())
        .then((value) => print('liked add'));
  }

  @override
  Future<LikeReview> likeExists(String idReview, String idUser) async {
    return await likes
        .where('idReview', isEqualTo: idReview)
        .where('idUser', isEqualTo: idUser)
        .limit(1)
        .get()
        .then((value) => LikeReview.fromJson(
            value.docs.first.data() as Map<String, dynamic>));
  }

  @override
  Future<void> deleteLike(LikeReview likeModel) {
    return likes
        .doc(likeModel.id)
        .delete()
        .then((value) => print('deleted like'));
  }
}
