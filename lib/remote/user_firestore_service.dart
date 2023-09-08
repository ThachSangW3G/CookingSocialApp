import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/user_model.dart';

abstract class UserDataService{
  Future<UserModel> getUser(String uid);
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



}