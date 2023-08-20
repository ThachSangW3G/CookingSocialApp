import 'package:cooking_social_app/components/line_row.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class AccountPerSonScreen extends StatefulWidget {
  const AccountPerSonScreen({super.key});

  @override
  State<AccountPerSonScreen> createState() => _AccountPerSonScreenState();
}

class _AccountPerSonScreenState extends State<AccountPerSonScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  late PageController _favoritesPageController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _pageController =
        PageController(initialPage: 0, viewportFraction: 0.8, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/image_background.png'),
                      fit: BoxFit.fill)),
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: AppColors.white, shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.black,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: AppColors.white, shape: BoxShape.circle),
                        child: Center(
                            child: Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/icons/pencil.png'),
                          )),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 210),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 190,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: AppColors.white,
                        ),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  Text(
                                    'Menu ayam spesial',
                                    style: TextStyle(
                                      fontFamily: 'Recoleta',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                      'Keep it easy with these simple but delicious recipes.',
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      overflow: TextOverflow.clip,
                                      style: kLabelTextStyle),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('24', style: kLabelTextStyle),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text('Followers', style: kLabelTextStyle),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        '|',
                                        style: TextStyle(
                                            fontFamily: 'CeraPro',
                                            fontSize: 30,
                                            color: AppColors.greyIron),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text('8', style: kLabelTextStyle),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text('Following', style: kLabelTextStyle)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 40,
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
                                width: 280,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Posts',
                                  style: TextStyle(
                                      fontFamily: 'CeraPro', fontSize: 17),
                                ),
                              ),
                            ),

                            // second tab [you can add an icon using the icon property]
                            Tab(
                              child: Container(
                                width: 280,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Reviews',
                                  style: TextStyle(
                                      fontFamily: 'CeraPro', fontSize: 17),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const LineRow()
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 160),
              width: double.infinity,
              height: 90,
              alignment: Alignment.center,
              child: Container(
                height: 90,
                width: 90,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/avatar.jpg'),
                        fit: BoxFit.contain),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 5,
                        blurRadius: 0.1,
                        offset: Offset(0, 1),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
