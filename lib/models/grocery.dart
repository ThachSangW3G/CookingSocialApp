import 'package:cloud_firestore/cloud_firestore.dart';

class Grocery {
  String key;
  Timestamp date;
  List<String> material;
  List<String> spice;
  String recipeId;
  String uidUser;
  
  Grocery(
    {required this.key,
    required this.date,
    required this.material,
    required this.spice,
    required this.recipeId,
    required this.uidUser});

  factory Grocery.fromJson(Map<String, dynamic> json) {
    return Grocery(
        key: json['id'] as String,
        date: json['date' as DateTime],
        material: List<String>.from(json['material']),
        spice: List<String>.from(json['spice']),
        recipeId: json['recipeIds'] as String,
        uidUser: json['uidUser'] as String);
  }
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'date': date,
      'material': material,
      'spice': spice,
      'recipeId': recipeId,
      'uidUser': uidUser
    };
  }
}
