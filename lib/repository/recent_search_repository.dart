import 'package:cooking_social_app/models/recent_search.dart';
import 'package:cooking_social_app/remote/recent_search_firestore_service.dart';
import 'package:cooking_social_app/remote/recipe_firestore_sevice.dart';

abstract class RecentSearchRepository{
  Future<List<RecentSearch>> getListRecentByIdUser(String idUser);
}

class RecentSearchRepositoryImpl implements RecentSearchRepository{

  RecentSearchFirestoreService _recentSearchFirestoreService;

  RecentSearchRepositoryImpl({RecentSearchFirestoreService? recentSearchFirestoreService}) : _recentSearchFirestoreService = recentSearchFirestoreService ?? RecentSearchFirestoreService();

  @override
  Future<List<RecentSearch>> getListRecentByIdUser(String idUser) {
    return _recentSearchFirestoreService.getListRecentByIdUser(idUser);
  }

}