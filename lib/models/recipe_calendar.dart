import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeCalendar{
  final String id;
  final Timestamp date;
  final String meal;
  final String idRecipe;

  RecipeCalendar({required this.id, required this.date, required this.meal, required this.idRecipe});

  factory RecipeCalendar.fromJson(Map<String, dynamic> json){
    return RecipeCalendar(
      id: json['id'],
      date: json['date'],
      meal: json['meal'],
      idRecipe: json['idRecipe']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'date': date,
      'meal': meal,
      'idRecipe': idRecipe
    };
  }
}