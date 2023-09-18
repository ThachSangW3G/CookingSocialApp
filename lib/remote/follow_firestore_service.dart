import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/follow_model.dart';

abstract class FollowDataService{
  Future<void> addFollow(FollowModel followModel);
  Future<FollowModel> followExist(String idUserOwner, String idUserFollower);
  Future<void> deleteFollow(FollowModel followModel);
  Future<int> getFollower(String idUser);
  Future<int> getFollowing(String idUser);
}

class FollowFirestoreService implements FollowDataService{

  CollectionReference follows = FirebaseFirestore.instance.collection('follows');

  @override
  Future<void> addFollow(FollowModel followModel) {
    return follows.doc(followModel.id).set(followModel.toJson()).then((value) => print('follow added'));
  }

  @override
  Future<FollowModel> followExist(String idUserOwner, String idUserFollower) async {
    return await follows
        .where('idUserOwner', isEqualTo: idUserOwner)
        .where('idUserFollower', isEqualTo: idUserFollower)
        .limit(1)
        .get().then((value) => FollowModel.fromJson( value.docs.first.data() as Map<String, dynamic>));

  }

  @override
  Future<void> deleteFollow(FollowModel followModel) {
    return follows.doc(followModel.id).delete().then((value) => print('deleted follow'));
  }

  @override
  Future<int> getFollower(String idUser) async {
    QuerySnapshot querySnapshot = await follows
        .where('idUserOwner', isEqualTo: idUser)
        .get();

    int count = querySnapshot.size;
    return count;
  }

  @override
  Future<int> getFollowing(String idUser) async {
    QuerySnapshot querySnapshot = await follows
        .where('idUserFollower', isEqualTo: idUser)
        .get();

    int count = querySnapshot.size;
    return count;
  }

}