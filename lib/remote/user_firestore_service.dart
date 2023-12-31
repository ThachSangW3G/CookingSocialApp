import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/user_model.dart';

abstract class UserDataService{
  Future<UserModel> getUser(String uid);
  Future<List<UserModel>> getAllUsers();
  Future<void> updateUser(UserModel user);
}

class UserFirestoreService implements UserDataService{

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Future<UserModel> getUser(String uid) async {
    return await users.doc(uid).get().then(
        (DocumentSnapshot doc){
          final data = UserModel.fromJson(doc.data() as Map<String, dynamic>);
          return Future.value(data);
        }
    );

  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> userList = [];
    await users.get().then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc){
        userList.add(UserModel.fromJson(doc.data() as Map<String, dynamic>));

      });
    });

    return Future.value(userList);
  }

  @override
  Future<void> updateUser(UserModel userModel) {
    return users.doc(userModel.uid).update(userModel.toJson()).then((value) => print(''));
  }


}
