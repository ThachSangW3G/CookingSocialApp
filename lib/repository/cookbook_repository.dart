import 'package:cooking_social_app/models/cookbook.dart';
import 'package:cooking_social_app/remote/cookbook_firestore_service.dart';

abstract class CookbookRepository {
  Future<List<CookBook>> getAllCookbooks();
  Future<void> addCookbook(CookBook cookBook);
  Future<List<CookBook>> getListCookbookbyIdUser(String idUser);
  Future<void> updateCookbook(CookBook cookBook);
  Future<CookBook> getCookbook(String id);
}

class CookbookRepositoryImpl implements CookbookRepository{

  final CookbookFirestoreService _cookbookFirestoreService;

  CookbookRepositoryImpl({CookbookFirestoreService? cookbookFirestoreService}): _cookbookFirestoreService = cookbookFirestoreService ?? CookbookFirestoreService();

  @override
  Future<List<CookBook>> getAllCookbooks() {
    return _cookbookFirestoreService.getAllCookbooks();
  }

  @override
  Future<void> addCookbook(CookBook cookBook) {
    return _cookbookFirestoreService.addCookbook(cookBook);
  }

  @override
  Future<List<CookBook>> getListCookbookbyIdUser(String idUser) {
    return _cookbookFirestoreService.getListCookbookbyIdUser(idUser);
  }

  @override
  Future<void> updateCookbook(CookBook cookBook) {
    return _cookbookFirestoreService.updateCookbook(cookBook);
  }

  @override
  Future<CookBook> getCookbook(String id) {
    return _cookbookFirestoreService.getCookbook(id);
  }

}