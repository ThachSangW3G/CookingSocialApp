import 'package:cooking_social_app/components/recipe_summary.dart';
import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/widgets/tab_content_ingredients.dart';
import 'package:cooking_social_app/widgets/tab_content_intro.dart';
import 'package:cooking_social_app/widgets/tab_content_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({super.key});

  @override
  State<RecipeDetailsScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RecipeDetailsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whitePorcelain,
        body: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const RecipeSummary(),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                          color: AppColors.orangeCrusta,
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: AppColors.greyShuttle,
                        dividerColor: Colors.white,
                        tabs: [
                          Tab(
                            child: Container(
                              width: 100,
                              alignment: Alignment.center,
                              child: const Text(
                                'Intro',
                                style: TextStyle(
                                    fontFamily: 'CeraPro', fontSize: 17),
                              ),
                            ),
                          ),

                          // second tab [you can add an icon using the icon property]
                          Tab(
                            child: Container(
                              width: 100,
                              alignment: Alignment.center,
                              child: const Text(
                                'Ingredients',
                                style: TextStyle(
                                    fontFamily: 'CeraPro', fontSize: 17),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              width: 100,
                              alignment: Alignment.center,
                              child: const Text(
                                'Steps',
                                style: TextStyle(
                                    fontFamily: 'CeraPro', fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: TabBarView(
                          controller: _tabController,
                          children: const [
                            TabContentIntro(),
                            TabContentIngredients(),
                            TabContentSteps()
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppColors.greyIron))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {},
                child: const SizedBox(
                  height: 30,
                  width: 30,
                  child: Image(
                    image: AssetImage('assets/icons/pencil.png'),
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/icon_svg/cart.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/icon_svg/calendar-check.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: SvgPicture.asset(
                    'assets/icon_svg/options.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
