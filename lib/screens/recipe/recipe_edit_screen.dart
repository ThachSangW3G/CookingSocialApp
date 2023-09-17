import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/widgets/recipe_ingredients_edit_view.dart';
import 'package:cooking_social_app/widgets/recipe_intro_edit_view.dart';
import 'package:cooking_social_app/widgets/recipe_steps_edit_view.dart';
// import 'package:cooking_social_app/widgets/yes_no_slider.dart';
import 'package:cooking_social_app/widgets/yes_no_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

// enum Choice { A, B, C }

class RecipeEditScreen extends StatefulWidget {
  const RecipeEditScreen({Key? key}) : super(key: key);

  @override
  State<RecipeEditScreen> createState() => _RecipeEditScreenState();
}

class _RecipeEditScreenState extends State<RecipeEditScreen>
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recipe Form",
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
            buildTab(1, 'Ingredients', 2),
            buildTab(2, 'Steps', 1),
          ],
        ),
        // systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const RecipeIntroEdit(),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 30),
            child: Stack(
              children: [
                const Column(
                  children: [
                    RecipeIngredientsEdit(),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        // Xử lý khi nút được nhấn
                      },
                      child: Icon(Icons.add),
                      backgroundColor: AppColors.orangeCrusta,
                      foregroundColor: AppColors.white,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    
                    ),
                  ),
                ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Stack(
              children: [
                RecipeStepsEdit(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        // Xử lý khi nút được nhấn
                      },
                      child: Icon(Icons.add),                      
                      backgroundColor: AppColors.orangeCrusta,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
              ]
              ),
          ),
        ],
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

  void _showGobackPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure you want to go back?'),
          content: const Text('Any changes you made will be lost.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancle'),
            ),
          ],
        );
      },
    );
  }
}
