import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/recipe_calendar.dart';

abstract class CalendarDataService{
  Future<void> addRecipeCalendar(RecipeCalendar recipeCalendar);
  Future<List<RecipeCalendar>> getRecipeCalendar(DateTime date);
}

class CalendarFirestoreService implements CalendarDataService{

  CollectionReference calendars = FirebaseFirestore.instance.collection('calendars');

  @override
  Future<void> addRecipeCalendar(RecipeCalendar recipeCalendar) {
    return calendars.doc(recipeCalendar.id).set(recipeCalendar.toJson()).then((value) => print('calendar add'));
  }

  @override
  Future<List<RecipeCalendar>> getRecipeCalendar(DateTime date) async {
    final startDate = DateTime(date.year, date.month, date.day);
    final endDate = DateTime(date.year, date.month, date.day + 1);

    List<RecipeCalendar> list = [];
    await calendars
        .where('date', isGreaterThanOrEqualTo: startDate)
        .where('date', isLessThan: endDate)
        .get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        list.add(RecipeCalendar.fromJson(doc.data() as Map<String, dynamic>));
        //print(notificationList.length);
      });
    });

    return Future.value(list);
  }

}