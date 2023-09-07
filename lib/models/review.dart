class Review {
  String key;
  String uidUser;
  String description;
  String time;
  String keyRecipe;

  Review(
      {required this.uidUser,
      required this.description,
      required this.key,
      required this.time,
      required this.keyRecipe});

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'uidUser': uidUser,
      'description': description,
      'time': time,
      'keyRecipe': keyRecipe,
    };
  }

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      key: json['key'],
      uidUser: json['uidUser'],
      description: json['description'],
      time: json['time'],
      keyRecipe: json['keyRecipe'],
    );
  }
}
