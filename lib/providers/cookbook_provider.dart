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

  String searchText = '';
  List<CookBook> searchCookbook = [];

  int pageCurrent = 1;
  PageController pageController = PageController();

  List<CookBook> cookbookOptions = [];

  CookbookProvider(){
    _cookbookRepository = CookbookRepositoryImpl();
    init();
  }


  init() async {
    _cookbooks = await _cookbookRepository.getAllCookbooks();

    notifyListeners();
  }

  Future<List<CookBook>> getListCookbook(){
    return _cookbookRepository.getAllCookbooks();
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

  setPage(int index){
    pageCurrent = index;
    notifyListeners();
  }

  Future<List<CookBook>> getSearchCookbookByIdUser(String idUser) async {

    if (searchText == ""){
      return _cookbookRepository.getListCookbookbyIdUser(idUser);
    }
    else {
      final cookbooks = await _cookbookRepository.getListCookbookbyIdUser(idUser);
      return searchCookbook = cookbooks.where((element) => element.title.toLowerCase().contains(searchText)).toList();
    }


  }

  Future<List<CookBook>> getListCookbookbyIdUser(String idUser){
    return _cookbookRepository.getListCookbookbyIdUser(idUser);
  }


  search(String value, String idUser){
    searchText = value;

    notifyListeners();

  }

  setListCookbookOption(String idUser) async {
    cookbookOptions = await _cookbookRepository.getListCookbookbyIdUser(idUser);
    notifyListeners();
  }

  bool isCookbookContantsRecipe(CookBook cookBook, String idRecipe){
    return cookBook.recipes.contains(idRecipe);
  }

  Future<void> updateCookbook(CookBook cookBook) async {
    await _cookbookRepository.updateCookbook(cookBook);
    notifyListeners();
  }

  Future<CookBook> getCookbook(String idCookbook) async {
    return await  _cookbookRepository.getCookbook(idCookbook);
  }

}