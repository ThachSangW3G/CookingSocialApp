import 'package:cloud_firestore/cloud_firestore.dart';

class LikeCookbook{
  final String id;
  final String idCookbook;
  final String idUser;
  final Timestamp time;

  LikeCookbook({required this.id, required this.idCookbook, required this.idUser, required this.time});


  factory LikeCookbook.fromJson(Map<String, dynamic> json){
    return LikeCookbook(
      id: json['id'],
      idCookbook: json['idCookbook'],
      idUser: json['idUser'],
      time: json['time']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'idCookbook': idCookbook,
      'idUser': idUser,
      'time': time
    };
  }
}