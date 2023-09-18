import 'package:cooking_social_app/models/recent_search.dart';
import 'package:cooking_social_app/models/recipe_item_unpublished.dart';
import 'package:cooking_social_app/providers/provider_authentication/recipe_provider.dart';
import 'package:cooking_social_app/providers/recent_search_provider.dart';
import 'package:cooking_social_app/widgets/recipe_item_unpublished_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/app_color.dart';

class SearchRecipeScreen extends StatefulWidget {
  const SearchRecipeScreen({super.key});

  @override
  State<SearchRecipeScreen> createState() => _SearchRecipeScreenState();
}

class _SearchRecipeScreenState extends State<SearchRecipeScreen> {

  bool _isSearch = false;
  RecipeProvider? recipeProvider;
  RecentSearchProvider? recentSearchProvider;




  Widget _buildSearch(){
    if (!_isSearch){
      return Column(
        children: [
          const SizedBox(height: 20.0,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  'Recent Search',
                  style: TextStyle(
                      fontFamily: 'Recoleta',
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(height: 20.0,),
          SizedBox(
            height: 150,
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<RecentSearchProvider>().getListRecentSearch(FirebaseAuth.instance.currentUser!.uid);
                //recentSearchProvider!.getListRecentSearch(FirebaseAuth.instance.currentUser!.uid);
              },
              child: ListView.builder(
                        itemCount: recentSearchProvider!.listRecentSearch.length > 3 ? 3 :recentSearchProvider!.listRecentSearch.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                        final recentSearch = recentSearchProvider!.listRecentSearch[index];
                        return RecentSearchWidget(search: recentSearch.title);
                        },
                        ),
            )
          ),

  const SizedBox(height: 10.0,),
    const Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
    children: [
    Text
    (
                  'Last Seen',
                  style: TextStyle(
                      fontFamily: 'Recoleta',
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }else{
      return
        Container(
          child: Expanded(

            child: ListView.builder(
              itemCount: recipeProvider!.searchRecipe.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
                print( recipeProvider!.searchRecipe.length);
                return RecipeItemUnPublishedWidget(
                  recipe: recipeProvider!.searchRecipe[index],
                );
              },
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    recipeProvider = Provider.of<RecipeProvider>(context);
    recentSearchProvider = Provider.of<RecentSearchProvider>(context)..getListRecentSearch(FirebaseAuth.instance.currentUser!.uid);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Recipe',
          style: TextStyle(
            fontFamily: 'Recoleta',
            fontSize: 20,
            fontWeight: FontWeight.w800
          ),
        ),
        leading: Container(),
        centerTitle: true,
        bottom:  PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: AppColors.greyIron,
            width: double.infinity,
            height: 1,
          ),
        ),
      ),
      body: Column(
        children: [

          const SizedBox(height: 15.0,),
          Container(
            height: 48,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                color: AppColors.greyIron
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(

                decoration: InputDecoration(
                  hintText: 'Recipe Title, Ingredient',
                  hintStyle: const TextStyle(
                      fontFamily: 'CeraPro',
                      fontSize: 17,
                      color: AppColors.greyShuttle
                  ),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: (){},
                    icon: SvgPicture.asset('assets/icon_svg/search.svg', height: 25, width: 25, color: AppColors.greyShuttle,
                    ),
                  ),

                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty){
                      _isSearch = false;
                    }else {
                      _isSearch = true;
                    }
                  });
                  recipeProvider!.search(value);
                  //print(recipeProvider!.searchRecipe.length);
                }
              ),
            ),
          ),
          _buildSearch()

        ],
      ),
    );
  }
}



class RecentSearchWidget extends StatelessWidget {
  final String search;
  const RecentSearchWidget({
    super.key, required this.search,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                width: 1,
                color: AppColors.greyIron,

              )
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              search,
              style: const TextStyle(
                fontFamily: 'CeraPro',
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),
            ),
            SvgPicture.asset(
              'assets/icon_svg/x.svg',
              height: 24,
              width: 24,
            )
          ],
        ),
      ),
    );
  }
}
