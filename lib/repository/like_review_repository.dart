import 'package:cooking_social_app/models/like_model.dart';
import 'package:cooking_social_app/models/like_review.dart';
import 'package:cooking_social_app/remote/like_firesotre_service.dart';
import 'package:cooking_social_app/remote/like_review_firestore_service.dart';

abstract class LikeReviewRepository {
  Future<void> addLike(LikeReview likeModel);
  Future<LikeReview> likeExists(String idReview, String idUser);
  Future<void> deleteLike(LikeReview likeModel);
}

class LikeReviewRepositoryImpl implements LikeReviewRepository {
  final LikeReviewFirestoreService _likeFirestoreService;

  LikeReviewRepositoryImpl({LikeReviewFirestoreService? likeFirestoreService})
      : _likeFirestoreService =
            likeFirestoreService ?? LikeReviewFirestoreService();

  @override
  Future<void> addLike(LikeReview likeModel) {
    return _likeFirestoreService.addLike(likeModel);
  }

  @override
  Future<LikeReview> likeExists(String idRecipe, String idUser) {
    return _likeFirestoreService.likeExists(idRecipe, idUser);
  }

  @override
  Future<void> deleteLike(LikeReview likeModel) {
    return _likeFirestoreService.deleteLike(likeModel);
  }
}
