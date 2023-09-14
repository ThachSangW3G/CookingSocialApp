import 'package:cooking_social_app/repository/recent_search_repository.dart';
import 'package:flutter/cupertino.dart';

import '../models/recent_search.dart';

class RecentSearchProvider extends ChangeNotifier{
  late RecentSearchRepository _recentSearchRepository;

  List<RecentSearch> listRecentSearch = [];

  RecentSearchProvider(String idUser)  {
    _recentSearchRepository = RecentSearchRepositoryImpl();

  }

   getListRecentSearch(String idUser) async {
    listRecentSearch = await _recentSearchRepository.getListRecentByIdUser(idUser);
    notifyListeners();
  }

}