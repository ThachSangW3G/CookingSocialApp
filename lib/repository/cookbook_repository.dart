import 'package:cooking_social_app/models/cookbook.dart';
import 'package:cooking_social_app/remote/cookbook_firestore_service.dart';

abstract class CookbookRepository {
  Future<List<CookBook>> getAllCookbooks();
  Future<void> addCookbook(CookBook cookBook);
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

}