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
  int numberView;
  int serves;
  String source;
  List<String> spice;
  List<String> steps;

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
      required this.numberView,
      required this.serves,
      required this.source,
      required this.spice,
      required this.steps
    });
}
