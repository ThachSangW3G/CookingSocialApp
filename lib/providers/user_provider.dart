
import 'package:cooking_social_app/models/user_model.dart';
import 'package:cooking_social_app/repository/user_repository.dart';
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

}