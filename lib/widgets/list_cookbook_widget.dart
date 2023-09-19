import 'package:cooking_social_app/providers/cookbook_provider.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:cooking_social_app/widgets/cookbook_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../constants/app_color.dart';

class ListCookbookWidget extends StatefulWidget {
  const ListCookbookWidget({super.key});

  @override
  State<ListCookbookWidget> createState() => _ListCookbookWidgetState();
}

class _ListCookbookWidgetState extends State<ListCookbookWidget> {
  @override
  Widget build(BuildContext context) {
    final CookbookProvider cookbookProvider = Provider.of<CookbookProvider>(context);
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

                          //print(recipeProvider!.searchRecipe.length);
                        }
                    ),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context, RouteGenerator.addCookbookScreen);

                  },
                  icon: SvgPicture.asset('assets/icon_svg/playlist-add.svg', height: 35, width: 35, color: AppColors.greyShuttle,
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 20,),

          Expanded(
            child: ListView.builder(
              itemCount: cookbookProvider.cookbooks.length,
              shrinkWrap: true,
              //physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                final cookbook = cookbookProvider.cookbooks[index];
                return CookBookWidget(cookBook: cookbook);
              },
            ),
          )
        ],
      ),
    );
  }
}
