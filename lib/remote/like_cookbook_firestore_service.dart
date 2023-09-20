import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/like_cookbook.dart';

abstract class LikeCookbookDataService{
  Future<void> addLikeCookbook(LikeCookbook likeCookbook);
  Future<void> deleteLikeCookbook(LikeCookbook likeCookbook);
  Future<LikeCookbook> likeCookbookExists(String idCookbook, String idUser);
}

class LikeCookbookFirestoreService implements LikeCookbookDataService{

  CollectionReference likeCookbooks = FirebaseFirestore.instance.collection('likeCookbooks');


  @override
  Future<void> addLikeCookbook(LikeCookbook likeCookbook) {
    return likeCookbooks.doc(likeCookbook.id).set(likeCookbook.toJson()).then((value) => print('likedcookbook add'));
  }

  @override
  Future<void> deleteLikeCookbook(LikeCookbook likeCookbook) {
    return likeCookbooks.doc(likeCookbook.id).delete().then((value) => print('deleted likecookbook'));
  }

  @override
  Future<LikeCookbook> likeCookbookExists(String idCookbook, String idUser) async {
    return await likeCookbooks
        .where('idCookbook', isEqualTo: idCookbook)
        .where('idUser', isEqualTo: idUser)
        .limit(1)
        .get().then((value) => LikeCookbook.fromJson( value.docs.first.data() as Map<String, dynamic>));


  }

}