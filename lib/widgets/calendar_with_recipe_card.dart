import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/models/recipe_calendar.dart';
import 'package:cooking_social_app/models/recipe_cookbook.dart';
import 'package:cooking_social_app/providers/provider_authentication/recipe_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RecipeCalendarCard extends StatelessWidget {

  final RecipeCalendar recipeCalendar;
  final VoidCallback option;

  const RecipeCalendarCard({super.key, required this.recipeCalendar, required this.option, });

  @override
  Widget build(BuildContext context) {

    final recipeProvider = Provider.of<RecipeProvider>(context);

    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          FutureBuilder<Recipe>(
            future: recipeProvider.getRecipe(recipeCalendar.idRecipe),
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else {

                final recipe = snapshot.data;

                return ListTile(
                  title: Text(
                    recipeCalendar.meal,
                    style: const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'CeraPro', fontSize: 16, color: AppColors.orangeCrusta),
                  ),
                  subtitle: Text(
                    recipe!.name,
                    style: const TextStyle(fontFamily: 'CeraPro', fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  trailing: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icon_svg/options.svg',
                      height: 24,
                      width: 24,
                    ),
                    onPressed: option,
                  ),
                );
              }
            },
          ),
          const Divider(thickness: 1, color: AppColors.greyIron, )
        ],
      ),
    );
  }
}