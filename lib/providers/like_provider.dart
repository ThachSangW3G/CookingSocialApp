import 'package:cooking_social_app/models/like_model.dart';
import 'package:cooking_social_app/repository/like_repository.dart';
import 'package:flutter/cupertino.dart';

class LikeProvider extends ChangeNotifier{
  late LikeRepository _likeRepository;

  LikeProvider(){
    _likeRepository = LikeRepositoryImpl();
  }

  Future<void> addLike(LikeModel likeModel) async {
    await _likeRepository.addLike(likeModel);
    notifyListeners();
  }

  Future<LikeModel> likeExist(String idRecipe, String idUser) async {
    return await _likeRepository.likeExists(idRecipe, idUser);
  }

  Future<void> deleteLike(LikeModel likeModel) async {
    await _likeRepository.deleteLike(likeModel);
    notifyListeners();
  }
}