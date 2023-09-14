import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/models/recent_search.dart';

abstract class RecentSearchDataService {
  Future<List<RecentSearch>> getListRecentByIdUser(String idUser);
}

class RecentSearchFirestoreService implements RecentSearchDataService{

  final CollectionReference recentSearchs = FirebaseFirestore.instance.collection('recentSearchs');

  @override
  Future<List<RecentSearch>> getListRecentByIdUser(String idUser) async {
    List<RecentSearch> listRecentSearch = [];
    await recentSearchs.where('idUser', isEqualTo: idUser).get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        listRecentSearch.add(RecentSearch.fromJson(doc.data() as Map<String, dynamic>));
        //print(recipeList.length);
      });
    });
    listRecentSearch.sort((a, b) => a.time.compareTo(b.time));

    return Future.value(listRecentSearch);
  }

}