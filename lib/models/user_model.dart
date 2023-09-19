import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String avatar;
  String email;
  String name;
  String bio;

  UserModel({required this.uid, required this.avatar, required this.name, required this.email, required this.bio});


  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      uid: json['uid'] ?? "",
      avatar: json["avatar"] ?? "",
      email: json["email"] ?? "",
      name: json["name"] ?? "",
      bio: json['bio'] ?? ""
    );
  }

   Map<String, dynamic> toJson(){
    return {
      'uid': uid,
      'avatar': avatar,
      'email': email,
      'name': name,
      'bio': bio,
    };
  }

   set _avatar(String value) {
    avatar = value;
  }

  set _email(String value) {
    email = value;
  }

  set _name(String value) {
    name = value;
  }

  set _bio(String value) {
    bio = value;
  }
}