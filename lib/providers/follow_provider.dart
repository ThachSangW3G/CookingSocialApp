import 'package:cooking_social_app/models/follow_model.dart';
import 'package:cooking_social_app/repository/follow_repository.dart';
import 'package:flutter/cupertino.dart';

class FollowProvider extends ChangeNotifier{

  late FollowRepository _followRepository;

  FollowProvider(){
    _followRepository = FollowRepositoryImpl();
  }

  Future<void> addFollow(FollowModel followModel) async {
    await _followRepository.addFollow(followModel);
    notifyListeners();
  }


  Future<FollowModel> followExist(String idUserOwner, String idUserFollower) async {
    return await _followRepository.followExist(idUserOwner, idUserFollower);
  }

  Future<void> deleteFollow(FollowModel followModel) async {
    await _followRepository.deleteFollow(followModel);
    notifyListeners();
  }

  Future<int> getFollower(String idUser){
    return _followRepository.getFollower(idUser);
  }

  Future<int> getFollowing(String idUser){
    return _followRepository.getFollowing(idUser);
  }


}