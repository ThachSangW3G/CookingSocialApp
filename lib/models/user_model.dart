import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String avatar;
  String email;
  String name;

  UserModel({required this.uid, required this.avatar, required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      uid: json['uid'],
      avatar: json["avatar"],
      email: json["email"],
      name: json["name"],
    );
  }
}