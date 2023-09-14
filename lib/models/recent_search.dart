import 'package:cloud_firestore/cloud_firestore.dart';

class RecentSearch {
  final String id;
  final String title;
  final Timestamp time;
  final String idUser;

  const RecentSearch({required this.id, required this.title, required this.time, required this.idUser});

  factory RecentSearch.fromJson(Map<String, dynamic> json){
    return RecentSearch(
      id: json['id'],
      title: json['title'],
      time: json['time'],
      idUser: json['idUser']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'title': title,
      'time': time,
      'idUser': idUser
    };
  }
}