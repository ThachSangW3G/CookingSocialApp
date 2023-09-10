import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/cookbook.dart';

abstract class CookbookDataService{
  Future<List<CookBook>> getAllCookbooks();
}

class CookbookFirestoreService implements CookbookDataService{

  CollectionReference cookbooks = FirebaseFirestore.instance.collection('cookbooks');

  @override
  Future<List<CookBook>> getAllCookbooks() async {
    List<CookBook> cookbookList = [];
    await cookbooks.get().then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc){
        cookbookList.add(CookBook.fromJson(doc.data() as Map<String, dynamic>));
        //print(recipeList.length);
      });
    });

    return Future.value(cookbookList);
  }

}