import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/cookbook.dart';

abstract class CookbookDataService{
  Future<List<CookBook>> getAllCookbooks();
  Future<void> addCookbook(CookBook cookBook);
  Future<List<CookBook>> getListCookbookbyIdUser(String idUser);
  Future<void> updateCookbook(CookBook cookBook);
  Future<CookBook> getCookbook(String id);
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

  @override
  Future<void> addCookbook(CookBook cookBook) {
    return cookbooks.doc(cookBook.id).set(cookBook.toJson()).then((value) => print('cookbook add'));
  }

  @override
  Future<List<CookBook>> getListCookbookbyIdUser(String idUser) async {
    List<CookBook> listCookbook = [];
    await cookbooks
        .where('idUser', isEqualTo: idUser)
        .get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        listCookbook.add(CookBook.fromJson(doc.data() as Map<String, dynamic>));
        //print(notificationList.length);
      });
    });

    return Future.value(listCookbook);
  }

  @override
  Future<void> updateCookbook(CookBook cookBook) {
    return cookbooks
        .doc(cookBook.id)
        .update(cookBook.toJson())
        .then((value) => print('cookbook updated'));
  }

  @override
  Future<CookBook> getCookbook(String id) async {
    return await cookbooks.doc(id).get().then(
            (DocumentSnapshot doc){
          final data = CookBook.fromJson(doc.data() as Map<String, dynamic>);
          return Future.value(data);
        }
    );
  }




}