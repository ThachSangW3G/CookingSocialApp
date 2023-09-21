import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/recipe_cookbook.dart';

abstract class RecipeDataService {
  Future<List<Recipe>> getAllRecipes();
  Future<Recipe> getRecipe(String idRecipe);
  Future<void> updateRecipe(Recipe recipe);
  Future<List<Recipe>> getListRecipesByIdUser(String idUser);
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


  @override
  Future<Recipe> getRecipe(String idRecipe) async {
    return await recipes.doc(idRecipe).get().then(
            (DocumentSnapshot doc){
          final data = Recipe.fromJson(doc.data() as Map<String, dynamic>);
          return Future.value(data);
        }
    );
  }

  Future<void> updateRecipe(Recipe recipe){
    return recipes
        .doc(recipe.key)
        .update(recipe.toJson())
        .then((value) => print('recipe updated'));

  }

  @override
  Future<List<Recipe>> getListRecipesByIdUser(String idUser) async {
    List<Recipe> listRecipe = [];
    await recipes
        .where('uidUser', isEqualTo: idUser)
        .get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        listRecipe.add(Recipe.fromJson(doc.data() as Map<String, dynamic>));

      });
    });



    return Future.value(listRecipe);
  }


}
