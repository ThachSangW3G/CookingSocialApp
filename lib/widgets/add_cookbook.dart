
import 'package:cooking_social_app/providers/provider_authentication/recipe_provider.dart';
import 'package:cooking_social_app/widgets/edit_information_cookbook.dart';
import 'package:cooking_social_app/widgets/recipe_item_published_widget.dart';
import 'package:cooking_social_app/widgets/recipe_select_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_color.dart';

class AddCookbookScreen extends StatefulWidget {
  const AddCookbookScreen({Key? key}) : super(key: key);

  @override
  State<AddCookbookScreen> createState() => _AddCookbookScreenState();
}

class _AddCookbookScreenState extends State<AddCookbookScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  // Choice selectedChoice = Choice.A;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final recipeProvider = Provider.of<RecipeProvider>(context);
    final recipes = recipeProvider.recipes;


    return WillPopScope(
      onWillPop: () async {

        final shouldPop = await _showGobackPopup(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cookbook Form",
            style: TextStyle(
                fontFamily: 'Recoleta',
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {

              _showGobackPopup(context);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Xử lý sự kiện khi người dùng nhấn vào nút
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  color: AppColors.orangeCrusta,
                  fontSize: 16.0,
                ),
              ),
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                25.0,
              ),
              color: AppColors.orangeCrusta,
            ),
            labelColor: AppColors.orangeCrusta,
            labelStyle: const TextStyle(
                fontFamily: 'CeraPro',
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: AppColors.greyBombay),
            dividerColor: Colors.white,
            tabs: [
              buildTab(0, 'Intro', 1),
              buildTab(1, 'Recipes', 2),
              buildTab(2, 'Selected', 1),
            ],
          ),
          // systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            EditInformationCookbook(),
            Container(
              child: ListView.builder(
                itemCount: recipeProvider.unSelected.length,
                itemBuilder: (context, index){
                  return RecipeSelect(
                    recipe: recipes[recipeProvider.unSelected[index]],
                    selected: false,
                    select: (){

                      recipeProvider.addSelected(recipeProvider.unSelected[index]);

                    },

                  );
                },
              ),
            ),
            Container(
              child: ListView.builder(
                itemCount: recipeProvider.selected.length,
                itemBuilder: (context, index){
                  return RecipeSelect(
                     recipe: recipes[recipeProvider.selected[index]],
                    selected: true,
                    select: (){
                       recipeProvider.removeSelected(recipeProvider.selected[index]);


                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTab(int index, String text, int type) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
        _tabController.animateTo(index);
      },
      child: Container(
        height: 36,
        width: (type == 1 ? 103 : 120),
        // color: _selectedTabIndex == index ? AppColors.orangeCrusta : null,
        // padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: _selectedTabIndex == index
                  ? Colors.white
                  : AppColors.greyBombay,
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _showGobackPopup(BuildContext context) async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure you want to go back?'),
          content: const Text('Any changes you made will be lost.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancle'),
            ),
          ],
        );
      },
    );
    return shouldPop;
  }
}
