import 'package:cooking_social_app/models/recipe_calendar.dart';
import 'package:cooking_social_app/repository/calendar_repository.dart';
import 'package:flutter/cupertino.dart';

class CalendarProvider extends ChangeNotifier{
  late CalendarRepository _calendarRepository;

  CalendarProvider(){
    _calendarRepository = CalendarRepositoryImpl();
  }

  DateTime dateSelected = DateTime.now();

  addRecipeCalendar(RecipeCalendar recipeCalendar) async {
    await _calendarRepository.addRecipeCalendar(recipeCalendar);

    notifyListeners();
  }

  selectDate(DateTime date){
    dateSelected = date;
    notifyListeners();
  }

  Future<List<RecipeCalendar>> getRecipeCalendar(DateTime date){
    return _calendarRepository.getRecipeCalendar(date);
  }

}