import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel{
  final String id;
  final String idUserOwner;
  final String idUserGuest;
  final String type;
  final String title;
  final Timestamp time;
  bool read;

  NotificationModel({required this.id, required this.idUserOwner, required this.idUserGuest, required this.type,
      required this.title, required this.time, required this.read});

  factory NotificationModel.fromJson(Map<String, dynamic> json){
    return NotificationModel(
      id: json['id'],
      idUserOwner: json['idUserOwner'],
      idUserGuest: json['idUserGuest'],
      time: json['time'],
      title: json['title'] ?? "",
      type: json['type'],
      read: json['read']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'idUserOwner': idUserOwner,
      'idUserGuest': idUserGuest,
      'time': time,
      'title': title,
      'type': type,
      'read': read
    };
  }
}