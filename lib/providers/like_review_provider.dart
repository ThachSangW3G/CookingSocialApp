import 'package:cooking_social_app/models/like_model.dart';
import 'package:cooking_social_app/models/like_review.dart';
import 'package:cooking_social_app/repository/like_repository.dart';
import 'package:cooking_social_app/repository/like_review_repository.dart';
import 'package:flutter/cupertino.dart';

class LikeReviewProvider extends ChangeNotifier {
  late LikeReviewRepository _likeRepository;

  LikeReviewProvider() {
    _likeRepository = LikeReviewRepositoryImpl();
  }

  Future<void> addLike(LikeReview likeModel) async {
    await _likeRepository.addLike(likeModel);
    notifyListeners();
  }

  Future<LikeReview> likeExist(String idReview, String idUser) async {
    return await _likeRepository.likeExists(idReview, idUser);
  }

  Future<void> deleteLike(LikeReview likeModel) async {
    await _likeRepository.deleteLike(likeModel);
    notifyListeners();
  }
}
