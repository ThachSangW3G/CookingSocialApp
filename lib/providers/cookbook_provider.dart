import 'package:cooking_social_app/models/cookbook.dart';
import 'package:cooking_social_app/repository/cookbook_repository.dart';
import 'package:flutter/cupertino.dart';

class CookbookProvider extends ChangeNotifier{
  late CookbookRepository _cookbookRepository;

  List<CookBook> _cookbooks = <CookBook>[];

  List<CookBook> get cookbooks => _cookbooks;

  CookbookProvider(){
    _cookbookRepository = CookbookRepositoryImpl();
    init();
  }

  init() async {
    _cookbooks = await _cookbookRepository.getAllCookbooks();

    notifyListeners();
  }

}