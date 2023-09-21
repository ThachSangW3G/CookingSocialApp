import 'package:cooking_social_app/models/cookbook.dart';
import 'package:cooking_social_app/models/user_model.dart';
import 'package:cooking_social_app/providers/cookbook_provider.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:cooking_social_app/widgets/cookbook_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../constants/app_color.dart';
import '../providers/provider_authentication/recipe_provider.dart';

class ListCookbookWidget extends StatefulWidget {

  final UserModel user;
  const ListCookbookWidget({super.key, required this.user});



  @override
  State<ListCookbookWidget> createState() => _ListCookbookWidgetState();
}

class _ListCookbookWidgetState extends State<ListCookbookWidget> {


  final userCurrent = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final CookbookProvider cookbookProvider = Provider.of<CookbookProvider>(context);
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final bool isOwner = userCurrent.uid ==  widget.user.uid;


    return Container(
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
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
                          cookbookProvider.search(value, widget.user.uid);
                          //print(recipeProvider!.searchRecipe.length);
                        }
                    ),
                  ),
                ),
              ),

              isOwner ? Container(
                margin: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context, RouteGenerator.addCookbookScreen);
                    recipeProvider.initSelect();
                  },
                  icon: SvgPicture.asset('assets/icon_svg/playlist-add.svg', height: 35, width: 35, color: AppColors.greyShuttle,
                  ),
                ),
              ) : Container()
            ],
          ),

          const SizedBox(height: 20,),

          Expanded(
            child: FutureBuilder<List<CookBook>>(
              future: cookbookProvider.getSearchCookbookByIdUser(widget.user.uid),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }else {
                  final cookbooks = snapshot.data;
                  return ListView.builder(
                    itemCount: cookbooks!.length,
                    shrinkWrap: true,
                    //physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      final cookbook = cookbooks![index];
                      return GestureDetector(
                        child: CookBookWidget(cookBook: cookbook),
                        onTap: (){
                          Navigator.of(context).pushNamed(
                              RouteGenerator.detailCookbook,
                              arguments: cookbook);
                        },
                      );
                    },
                  );
                }
              }
            ),
          )
        ],
      ),
    );
  }
}
