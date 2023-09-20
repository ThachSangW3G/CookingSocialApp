import 'package:cooking_social_app/remote/like_cookbook_firestore_service.dart';

import '../models/like_cookbook.dart';

abstract class LikeCookbookRepository{
  Future<void> addLikeCookbook(LikeCookbook likeCookbook);
  Future<void> deleteLikeCookbook(LikeCookbook likeCookbook);
  Future<LikeCookbook> likeCookbookExists(String idCookbook, String idUser);
}

class LikeCookbookReposotoryImpl implements LikeCookbookRepository{


  LikeCookbookFirestoreService _firestoreService;

  LikeCookbookReposotoryImpl({LikeCookbookFirestoreService? firestoreService}) : _firestoreService = firestoreService ?? LikeCookbookFirestoreService();


  @override
  Future<void> addLikeCookbook(LikeCookbook likeCookbook) {
    return _firestoreService.addLikeCookbook(likeCookbook);
  }

  @override
  Future<void> deleteLikeCookbook(LikeCookbook likeCookbook) {
    return _firestoreService.deleteLikeCookbook(likeCookbook);
  }

  @override
  Future<LikeCookbook> likeCookbookExists(String idCookbook, String idUser) {
    return _firestoreService.likeCookbookExists(idCookbook, idUser);
  }

}

