class CookBook {
  final String id;
  final String title;
  final String description;
  final int likes;
  final List<dynamic> recipes;
  final String image;
  final int popularRecipeIndex;

  CookBook({
      required this.id, required this.title, required this.description, required this.likes, required this.recipes, required this.image, required this.popularRecipeIndex});

  factory CookBook.fromJson(Map<String, dynamic> json){
    return CookBook(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      likes: json['likes'],
      recipes: json['recipes'],
      image: json['image'],
      popularRecipeIndex: json['popularRecipeIndex']
    );
  }

}
// List<CookBook> cookBookList = [
//   CookBook(1, 'Buku resep spesial antara', 'Keep it easy with these simple but delicious recipes',
//       23,  7, 'assets/images/background_1.jpg'),
//   CookBook(2, 'Buku resep spesial antara', 'Keep it easy with these simple but delicious recipes',
//       25,  6, 'assets/images/background_splash_1.jpg'),
//   CookBook(3, 'Buku resep spesial antara', 'Keep it easy with these simple but delicious recipes',
//       56,  9, 'assets/images/background_splash_2.jpg'),
// ];

