class CookBook {
  final int id;
  final String title;
  final String describe;
  final int like;
  final int recipe;
  final String image;

  CookBook(
      this.id, this.title, this.describe, this.like, this.recipe, this.image);


}
List<CookBook> cookBookList = [
  CookBook(1, 'Buku resep spesial antara', 'Keep it easy with these simple but delicious recipes',
      23,  7, 'assets/images/background_1.jpg'),
  CookBook(2, 'Buku resep spesial antara', 'Keep it easy with these simple but delicious recipes',
      25,  6, 'assets/images/background_splash_1.jpg'),
  CookBook(3, 'Buku resep spesial antara', 'Keep it easy with these simple but delicious recipes',
      56,  9, 'assets/images/background_splash_2.jpg'),
];