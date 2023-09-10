import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/user_model.dart';
import 'package:cooking_social_app/remote/user_firestore_service.dart';

abstract class UserRepository {
  Future<UserModel> getUser(String uid);
  Future<List<UserModel>> getAllUsers();
}

class UserRepositoryImpl implements UserRepository{

  final UserFirestoreService _userFirestoreService;

  UserRepositoryImpl({UserFirestoreService? userFirestoreService}): _userFirestoreService = userFirestoreService ??  UserFirestoreService();

  @override
  Future<UserModel> getUser(String uid) {
    return _userFirestoreService.getUser(uid);
  }

  @override
  Future<List<UserModel>> getAllUsers() {
    return _userFirestoreService.getAllUsers();
  }

}