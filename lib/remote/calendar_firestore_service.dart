import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/recipe_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class CalendarDataService{
  Future<void> addRecipeCalendar(RecipeCalendar recipeCalendar);
  Future<List<RecipeCalendar>> getRecipeCalendar(DateTime date);
  Future<void> deleteRecipeCalendar(RecipeCalendar recipeCalendar);
  Future<void> updateRecipeCalendar(RecipeCalendar recipeCalendar);
}

class CalendarFirestoreService implements CalendarDataService{

  CollectionReference calendars = FirebaseFirestore.instance.collection('calendars');

  @override
  Future<void> addRecipeCalendar(RecipeCalendar recipeCalendar) {
    return calendars.doc(recipeCalendar.id).set(recipeCalendar.toJson()).then((value) => print('calendar add'));
  }

  @override
  Future<void> deleteRecipeCalendar(RecipeCalendar recipeCalendar) {
    return calendars.doc(recipeCalendar.id).delete().then((value) => print('deleted calendar'));
  }


  @override
  Future<void> updateRecipeCalendar(RecipeCalendar recipeCalendar) {
    return calendars
        .doc(recipeCalendar.id)
        .update(recipeCalendar.toJson())
        .then((value) => print('recipeCalendar updated'));
  }


  @override
  Future<List<RecipeCalendar>> getRecipeCalendar(DateTime date) async {
    final startDate = DateTime(date.year, date.month, date.day);
    final endDate = DateTime(date.year, date.month, date.day + 1);

    List<RecipeCalendar> list = [];
    print(list);

    await calendars
        .where('idUser', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('date', isGreaterThanOrEqualTo: startDate)
        .where('date', isLessThan: endDate)
        .get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        list.add(RecipeCalendar.fromJson(doc.data() as Map<String, dynamic>));
        //print(notificationList.length);
      });
    }).onError((error, stackTrace){
      print(error);
    });


    return Future.value(list);
  }
  //
  // @override
  // Future<RecipeCalendar> recipeCalendarExists() async {
  //   return await likes
  //       .where('idRecipe', isEqualTo: idRecipe)
  //       .where('idUser', isEqualTo: idUser)
  //       .limit(1)
  //       .get().then((value) => LikeModel.fromJson( value.docs.first.data() as Map<String, dynamic>));
  //
  //
  // }


}