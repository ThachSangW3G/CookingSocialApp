import 'package:cooking_social_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationStateProvider extends ChangeNotifier{
  String? _email;

  String? _uid = FirebaseAuth.instance.currentUser!.uid;

  String? get getUID => _uid;
  String? get getEmail => _email;

  bool get isLoggedIn => _uid != null;

  final AuthService _authService = AuthService();

  Future<bool> createUserWithEmailAndPassword(String email, String password, String name) async {
    bool success = false;
    try{
      UserCredential? userCredential = await _authService.createUserWithEmailAndPassword(email, password);
      if(userCredential !=  null){
          await _authService.addDataUserEmail(userCredential, email, name);
          return success = true;
      }

    }catch(e){
      return success;
    }
    return success;
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    bool success = false;
    try {
      final credential = await _authService.signInWithEmailAndPassword(email, password);
      if(credential != null){
        return success = true;
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return success;
    }
    return success;
  }

  Future<bool> singInWithGoogle() async{
    bool success = false;
    try {
      UserCredential? userCredential = await _authService.signInWithGoogle();

      if (userCredential != null){
        _uid = userCredential.user!.uid;
        _email = userCredential.user?.email;

        await _authService.addDataUser(userCredential);
        // print(_uid);
        //print(userCredential);

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
        _uid = userCredential.user!.uid;
        _email = userCredential.user?.email;

        await _authService.addDataUserFacebook(userCredential);

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