import 'package:cooking_social_app/models/like_model.dart';
import 'package:cooking_social_app/remote/like_firesotre_service.dart';

abstract class LikeRepository {
  Future<void> addLike(LikeModel likeModel);
  Future<LikeModel> likeExists(String idRecipe, String idUser);
  Future<void> deleteLike(LikeModel likeModel);
}

class LikeRepositoryImpl implements LikeRepository{
  final LikeFirestoreService _likeFirestoreService;

  LikeRepositoryImpl({LikeFirestoreService? likeFirestoreService}) : _likeFirestoreService = likeFirestoreService ?? LikeFirestoreService();

  @override
  Future<void> addLike(LikeModel likeModel) {
    return _likeFirestoreService.addLike(likeModel);
  }

  @override
  Future<LikeModel> likeExists(String idRecipe, String idUser) {
    return _likeFirestoreService.likeExists(idRecipe, idUser);
  }

  @override
  Future<void> deleteLike(LikeModel likeModel) {
    return _likeFirestoreService.deleteLike(likeModel);
  }

}