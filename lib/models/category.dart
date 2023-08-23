class Category{
  final int id;
  final String image;
  final String name;

  Category(this.id, this.image, this.name);
}

List<Category> listCategory = [
  Category(1, 'assets/images/background_1.jpg', 'Seasonal'),
  Category(2, 'assets/images/background_splash_1.jpg', 'Cakes'),
  Category(3, 'assets/images/background_splash_2.jpg', 'Everyday'),
  Category(4, 'assets/images/background_splash_3.jpg', 'Drinks'),
  Category(5, 'assets/images/background_1.jpg', 'Vegetarian'),
];