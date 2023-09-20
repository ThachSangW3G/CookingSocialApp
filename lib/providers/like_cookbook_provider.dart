import 'package:cooking_social_app/models/like_cookbook.dart';
import 'package:cooking_social_app/repository/like_cookbook_repository.dart';
import 'package:flutter/cupertino.dart';

class LikeCookbookProvider extends ChangeNotifier{

  late LikeCookbookRepository _likeCookbookRepository;

  LikeCookbookProvider(){
    _likeCookbookRepository = LikeCookbookReposotoryImpl();
  }

  addLikeCookbook(LikeCookbook likeCookbook) async {
    await _likeCookbookRepository.addLikeCookbook(likeCookbook);
    notifyListeners();
  }


  deleteLikeCookbook(LikeCookbook likeCookbook) async {
    await _likeCookbookRepository.deleteLikeCookbook(likeCookbook);
    notifyListeners();
  }

  Future<LikeCookbook> likeCookbookExists(String idCookbook, String idUser) async {
    return await _likeCookbookRepository.likeCookbookExists(idCookbook, idUser);
  }

}