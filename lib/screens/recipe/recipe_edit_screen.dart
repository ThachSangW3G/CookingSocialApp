import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/widgets/recipe_ingredients_edit_view.dart';
import 'package:cooking_social_app/widgets/recipe_steps_edit_view.dart';
// import 'package:cooking_social_app/widgets/yes_no_slider.dart';
import 'package:cooking_social_app/widgets/yes_no_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Choice { A, B, C }

class RecipeEditScreen extends StatefulWidget {
  const RecipeEditScreen({Key? key}) : super(key: key);

  @override
  State<RecipeEditScreen> createState() => _RecipeEditScreenState();
}

class _RecipeEditScreenState extends State<RecipeEditScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  Choice selectedChoice = Choice.A;

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
          SingleChildScrollView(
              child: Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                    labelText: 'Title',
                    labelStyle: TextStyle(
                        fontFamily: 'CeraPro',
                        // fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),

                // COOK TIME--------------------------------------------
                const SizedBox(height: 24),
                const Text(
                  'Cooking Time',
                  style: TextStyle(
                      fontFamily: 'CeraPro',
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 0.0),
                            labelText: 'minutes',
                            labelStyle: TextStyle(
                                fontFamily: 'CeraPro',
                                // fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 0.0),
                          labelText: 'hours',
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),

                // IMAGE -------------------------------------
                const SizedBox(
                  height: 24,
                ),
                ClipRRect(
                  child: Image.asset(
                    'assets/images/defaut_food.png',
                    width: MediaQuery.of(context).size.width,
                    height: 208,
                    fit: BoxFit.cover,
                  ),
                ),

                // DESCRIPTION -------------------------------
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                      labelText: 'Description',
                      labelStyle: TextStyle(
                          fontFamily: 'CeraPro',
                          // fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  maxLines: null, // Cho phép hiển thị nhiều dòng văn bản
                  keyboardType:
                      TextInputType.multiline, // Bàn phím hiển thị dạng đa dòng
                  textInputAction: TextInputAction.newline,
                ),

                //-------------------------------------------
                const SizedBox(
                  height: 24,
                ),

                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Difficulty'),
                        Container(
                          width: 160,
                          child: DropdownButton<Choice>(
                            value: selectedChoice,

                            // style: const TextStyle(
                            // fontFamily: 'CeraPro',
                            // fontSize: 16,
                            // fontWeight: FontWeight.w400
                            // ),
                            underline: const Divider(
                              thickness: 1.5,
                              color: AppColors.greyBombay,
                            ),
                            isExpanded: true,
                            alignment: Alignment.bottomCenter,
                            padding: EdgeInsets.only(top: 8),
                            icon: Align(
                              alignment: Alignment.centerRight,
                              child: SvgPicture.asset(
                                'assets/icon_svg/chevron-circle-down.svg',
                                height: 15,
                                width: 8,
                              ),
                            ),
                            onChanged: (Choice? value) {
                              setState(() {
                                selectedChoice = value!;
                              });
                            },
                            items: const [
                              DropdownMenuItem<Choice>(
                                value: Choice.A,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Easy',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'CeraPro',
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.right)),
                              ),
                              DropdownMenuItem<Choice>(
                                value: Choice.B,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Medium',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'CeraPro',
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.right)),
                              ),
                              DropdownMenuItem<Choice>(
                                value: Choice.C,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Difficult',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'CeraPro',
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.right)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                    // const SizedBox(
                    //   width: 16,
                    // ),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 0.0),
                          labelText: 'Serve',
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),

                //---------------------
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        const Text(
                          'Publish to Community?',
                          style: TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 200,
                        ),
                        Expanded(child: YesNoSwitch()),
                      ],
                    )),
                  ],
                ),

                //---------------
                const SizedBox(
                  height: 24,
                ),
                const TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                      labelText: 'Source',
                      labelStyle: TextStyle(
                          fontFamily: 'CeraPro',
                          // fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ),

                //-----------------
                const SizedBox(
                  height: 24,
                ),
                const TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                      labelText: 'URL',
                      labelStyle: TextStyle(
                          fontFamily: 'CeraPro',
                          // fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          )),
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 30),
            child: Stack(
              children: [
                Column(
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
            padding: EdgeInsets.only(top: 16),
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
