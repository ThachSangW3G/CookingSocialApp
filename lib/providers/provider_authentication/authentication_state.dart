import 'package:cooking_social_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationStateProvider extends ChangeNotifier{
  String? _uid, _email;

  String? get getUID => _uid;
  String? get getEmail => _email;

  bool get isLoggedIn => _uid != null;

  final AuthService _authService = AuthService();

  Future<bool> singInWithGoogle() async{
    bool success = false;
    try {
      UserCredential? userCredential = await _authService.signInWithGoogle();

      if (userCredential != null){
        _uid = userCredential.user?.uid;
        _email = userCredential.user?.email;

        await _authService.addDataUser(userCredential);
        print(_uid);
        print(userCredential);

        return success = true;
      }
    }catch(e){
      return success;
    }
    return success;
  }

  Future<bool> singInWithFacebook() async{
    bool success = false;
    try {
      UserCredential? userCredential = await _authService.signInWithFacebook();

      if (userCredential != null){
        _uid = userCredential.user?.uid;
        _email = userCredential.user?.email;

        await _authService.addDataUser(userCredential);

        return success = true;
      }
    }catch(e){
      return success;
    }
    return success;
  }
  Future<bool> signOut() async{
    bool success = false;
    try {
      await _authService.signOut();

      _uid = null;
      _email = null;
      return success = true;
    }catch(e){
      return success;
    }
  }
}