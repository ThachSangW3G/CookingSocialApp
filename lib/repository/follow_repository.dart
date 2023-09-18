import 'package:cooking_social_app/models/follow_model.dart';
import 'package:cooking_social_app/remote/follow_firestore_service.dart';

abstract class FollowRepository{
  Future<void> addFollow(FollowModel followModel);
  Future<FollowModel> followExist(String idUserOwner, String idUserFollower);
  Future<void> deleteFollow(FollowModel followModel);
  Future<int> getFollower(String idUser);
  Future<int> getFollowing(String idUser);
}

class FollowRepositoryImpl implements FollowRepository{

  FollowFirestoreService _firestoreService;

  FollowRepositoryImpl({FollowFirestoreService? firestoreService}) : _firestoreService = firestoreService ?? FollowFirestoreService();

  @override
  Future<void> addFollow(FollowModel followModel) {
    return _firestoreService.addFollow(followModel);
  }


  @override
  Future<FollowModel> followExist(String idUserOwner, String idUserFollower) {
    return _firestoreService.followExist(idUserOwner, idUserFollower);
  }

  @override
  Future<void> deleteFollow(FollowModel followModel) {
    return _firestoreService.deleteFollow(followModel);
  }

  @override
  Future<int> getFollower(String idUser) {
    return _firestoreService.getFollower(idUser);
  }

  @override
  Future<int> getFollowing(String idUser) {
    return _firestoreService.getFollowing(idUser);
  }


}