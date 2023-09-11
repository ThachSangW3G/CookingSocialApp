import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/recipe_cookbook.dart';

abstract class RecipeDataService {
  Future<List<Recipe>> getAllRecipes();
}

class RecipeFirestoreService implements RecipeDataService {
  CollectionReference recipes =
      FirebaseFirestore.instance.collection('recipes');

  @override
  Future<List<Recipe>> getAllRecipes() async {
    List<Recipe> recipeList = [];
    await recipes.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        recipeList.add(Recipe.fromJson(doc.data() as Map<String, dynamic>));
        //print(recipeList.length);
      });
    });

    return Future.value(recipeList);
  }
}
