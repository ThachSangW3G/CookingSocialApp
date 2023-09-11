import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/category.dart';

abstract class CategoryDataService{
  Future<List<Category>> getAllCategories();
}

class CategoryFirebaseService implements CategoryDataService{

  CollectionReference categories = FirebaseFirestore.instance.collection('categories');

  @override
  Future<List<Category>> getAllCategories() async {
    List<Category> listCategory = [];

    await categories.get().then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc){
        listCategory.add(Category.fromJson(doc.data() as Map<String, dynamic>));
      });
    }) ;

    return Future.value(listCategory);
  }

}