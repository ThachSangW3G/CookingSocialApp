import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
  String key;
  String uidUser;
  String url;
  String name;
  int cookTime;
  String description;
  String difficult;
  bool isPublic;
  List<dynamic> material;
  int numberLike;
  int numberReView;
  int serves;
  String source;

  List<dynamic> spice;
  List<dynamic> steps;


  Recipe(
      {required this.key, required this.uidUser,
      required this.url,
      required this.name,
      required this.cookTime,
      required this.description,
      required this.difficult,
      required this.isPublic,
      required this.material,
      required this.numberLike,
      required this.numberReView,
      required this.serves,
      required this.source,
      required this.spice,

      required this.steps
    });


  factory Recipe.fromJson(Map<String, dynamic> json){

    return Recipe(
      key: json['id'],
      uidUser: json["uidUser"] ,
      url: json["URL"],
      name: json["name"],
      cookTime: json["cookTime"],
      description: json["description"],
      difficult: json["difficult"],
      isPublic: json["isPublic"],
      material: json["material"],
      numberLike: json["numberLike"],
      numberView: json["numberReview"],
      serves: json["serves"],
      source: json["source"],
      spice: json["spice"],
      steps: json["steps"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uidUser': uidUser,

      'URL': url,
      'name': name,
      'cookTime': cookTime,
      'description': description,
      'difficult': difficult,
      'isPublic': isPublic,
      'material': material,
      'numberLike': numberLike,

      'numberReview': numberView,
      'serves': serves,
      'source': source,
      'spice': spice,
      'steps': steps

    };
  }
}
