import 'package:cooking_social_app/models/recipe_calendar.dart';
import 'package:cooking_social_app/remote/calendar_firestore_service.dart';

abstract class CalendarRepository{
  Future<void> addRecipeCalendar(RecipeCalendar recipeCalendar);
  Future<List<RecipeCalendar>> getRecipeCalendar(DateTime date);
  Future<void> deleteRecipeCalendar(RecipeCalendar recipeCalendar);
  Future<void> updateRecipeCalendar(RecipeCalendar recipeCalendar);
}

class CalendarRepositoryImpl implements CalendarRepository{

  CalendarFirestoreService _firestoreService;

  CalendarRepositoryImpl({CalendarFirestoreService? firestoreService}): _firestoreService = firestoreService ?? CalendarFirestoreService();


  @override
  Future<void> addRecipeCalendar(RecipeCalendar recipeCalendar) {
    return _firestoreService.addRecipeCalendar(recipeCalendar);
  }

  @override
  Future<List<RecipeCalendar>> getRecipeCalendar(DateTime date) {
    return _firestoreService.getRecipeCalendar(date);
  }

  @override
  Future<void> deleteRecipeCalendar(RecipeCalendar recipeCalendar) {
    return _firestoreService.deleteRecipeCalendar(recipeCalendar);
  }

  @override
  Future<void> updateRecipeCalendar(RecipeCalendar recipeCalendar) {
    return _firestoreService.updateRecipeCalendar(recipeCalendar);
  }

}