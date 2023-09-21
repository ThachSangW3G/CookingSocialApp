import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Variables
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  //Getters
  String get getUserID => _auth.currentUser?.uid ?? "";

  bool setInitalScreen(User? user) {
    if (user != null) {
      return true;
    }
    return false;
  }

  Future<bool> isSignedIn() async {
    return await _auth.currentUser != null;
  }
  Future<User> getUser() async {
    return await _auth.currentUser!;
  }

  //Google sign in
  Future<UserCredential?> signInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    // finally, lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile']);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    //var userData = FacebookAuth.instance.getUserData();

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<void> logout(BuildContext context) async {
    await GoogleSignIn().signOut();

    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, RouteGenerator.login);
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    // ignore: use_build_context_synchronously
  }

  Future<void> addDataUser(UserCredential userCredential) async {
    DocumentSnapshot userSnapshot = await _fireStore
        .collection('users')
        .doc(userCredential.user!.uid)
        .get();
    if (!userSnapshot.exists) {
      // Thêm dữ liệu vào Firestore
      await _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'name': userCredential.user?.displayName,
        'email': userCredential.additionalUserInfo!.profile!['email'],
        'avatar': userCredential.additionalUserInfo!.profile!['picture']
        // Thêm các trường dữ liệu khác tùy ý
      });
    }
  }

  Future<void> addDataUserFacebook(UserCredential userCredential) async {
    DocumentSnapshot userSnapshot = await _fireStore
        .collection('users')
        .doc(userCredential.user!.uid)
        .get();
    if (!userSnapshot.exists) {
      // Thêm dữ liệu vào Firestore
      await _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'name': userCredential.user?.displayName,
        'email': userCredential.additionalUserInfo!.profile!['email'],
        'avatar': userCredential.additionalUserInfo!.profile!['picture']['data']['url']
        // Thêm các trường dữ liệu khác tùy ý
      });
    }
  }
}
