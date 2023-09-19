
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/user_model.dart';
import 'package:cooking_social_app/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{
  late UserRepository _userRepository;

  List<UserModel> _users = <UserModel>[];

  List<UserModel> get users => _users;



  CookbookProvider(){
    _userRepository = UserRepositoryImpl();
    init();
  }

  init() async {
    _users = await _userRepository.getAllUsers();
    notifyListeners();
  }


  Future<UserModel> getUser(String uid) async {
    _userRepository = UserRepositoryImpl();
    UserModel user = await _userRepository.getUser(uid);
    return user;
  }

  Future<void> updateUser(UserModel userModel) async {
    // try {
    //   String uid = userModel.uid;
    //   UserModel user = await _userRepository.getUser(uid);

    //   if (user != null) {
    //     final firestore = FirebaseFirestore.instance;
    //     final userRef = firestore.collection('users').doc(user.uid);

    //     // Tạo một map chứa thông tin người dùng cần cập nhật
    //     final updatedUserData = {
    //       'name': userModel.name ?? user.name,
    //       'email': userModel.email ?? user.email,
    //       'bio': userModel.bio ?? user.bio,
    //     };

    //     await userRef.update(updatedUserData);
    //     // Cập nhật thành công

    //     // Cập nhật lại thông tin người dùng trong danh sách _users (nếu cần)
    //     int index = _users.indexWhere((u) => u.uid == user.uid);
    //     if (index != -1) {
    //       _users[index] = userModel;
    //     }

    //     notifyListeners();
    //   }
    // } catch (error) {
    //   debugPrint(error.toString());
    // }
    await _userRepository.updateUser(userModel);
    notifyListeners();
  }

}