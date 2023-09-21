import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/grocery.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class GroceryDataService {
  // Future<List<Grocery>> getAllRecipes();
  Future<void> createGrogery(Grocery grocery);
  Future<List<Grocery>> getListGroceries();
}

class GroceryFireStoreService implements GroceryDataService {
  CollectionReference groceries = FirebaseFirestore.instance.collection('groceries');

  @override
  Future<void> createGrogery(Grocery grocery) {
    return groceries.doc(grocery.key).set(grocery.toJson()).then((value) => print('create GROCERY for user!'));
  }

  @override
  Future<List<Grocery>> getListGroceries() async {
    // return await groceries.doc(idGrocery).get().then((DocumentSnapshot doc) {
    //   final data = Grocery.fromJson(doc.data() as Map<String, dynamic>);
    //   return Future.value(data);
    // }
    // );

    List<Grocery> list = [];
    await groceries
        .where('userID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get().then((QuerySnapshot snapshot) {
          snapshot.docs.forEach((doc) {
              list.add(Grocery.fromJson(doc.data() as Map<String, dynamic>));
           });
        }).onError((error, stackTrace) { print(error); }
        );
        return Future.value(list);
  }

}