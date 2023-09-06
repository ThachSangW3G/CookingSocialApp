class Recipe {
  String key;
  String url;
  String name;
  int cookTime;
  String description;
  String difficult;
  bool isPublic;
  List<String> material;
  int numberLike;
  int numberReView;
  int serves;
  String source;
  List<String> spice;
  List<String> steps;
  String uidUser;
  Recipe(
      {required this.key,
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
      required this.steps,
      required this.uidUser});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        key: json['key'],
        url: json['url'],
        name: json['name'],
        cookTime: json['cookTime'],
        description: json['description'],
        difficult: json['difficult'],
        isPublic: json['isPublic'],
        material: List<String>.from(json['material']),
        numberLike: json['numberLike'],
        numberReView: json['numberView'],
        serves: json['serves'],
        source: json['source'],
        spice: List<String>.from(json['spice']),
        steps: List<String>.from(json['steps']),
        uidUser: json['uidUser']);
  }
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'URL': url,
      'name': name,
      'cookTime': cookTime,
      'description': description,
      'difficult': difficult,
      'isPublic': isPublic,
      'material': material,
      'numberLike': numberLike,
      'numberReView': numberReView,
      'serves': serves,
      'source': source,
      'spice': spice,
      'steps': steps,
      'uidUser': uidUser
    };
  }
}
