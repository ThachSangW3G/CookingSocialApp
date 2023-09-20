import 'dart:io';

import 'package:cooking_social_app/models/cookbook.dart';
import 'package:cooking_social_app/repository/cookbook_repository.dart';
import 'package:flutter/cupertino.dart';

class CookbookProvider extends ChangeNotifier{
  late CookbookRepository _cookbookRepository;

  List<CookBook> _cookbooks = <CookBook>[];

  List<CookBook> get cookbooks => _cookbooks;

  String title = '';
  String description = '';
  File? file;

  CookbookProvider(){
    _cookbookRepository = CookbookRepositoryImpl();
    init();
  }

  init() async {
    _cookbooks = await _cookbookRepository.getAllCookbooks();

    notifyListeners();
  }

  addCookbook(CookBook cookBook) async {
    await _cookbookRepository.addCookbook(cookBook);
    notifyListeners();
  }

  setTitle(String value){
    title = value;
    notifyListeners();
  }
  setDescription(String value){
    description = value;
    notifyListeners();
  }

  setImage(File fileImage){
    file = fileImage;
    notifyListeners();

  }
}