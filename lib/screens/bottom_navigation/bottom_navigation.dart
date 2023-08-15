import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int currentTab = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),

  ];


  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orangeCrusta,
        foregroundColor: AppColors.whitePorcelain,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 25, ),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 50,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 7),
        shape: const CircularNotchedRectangle(),
        notchMargin: 20,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = const HomeScreen();
                      currentTab = 0;

                    });
                  },
                  child: Icon(
                    Icons.home,
                    color: currentTab == 0 ? AppColors.orangeCrusta : Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,

                  onPressed: (){
                    setState(() {
                      currentScreen = const HomeScreen();
                      currentTab = 1;

                    });
                  },
                  child: Icon(
                    Icons.search,
                    color: currentTab == 1 ? AppColors.orangeCrusta : Colors.black,
                  ),
                ),
              ),
              Container(
                width: 70,
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = const HomeScreen();
                      currentTab = 2;

                    });
                  },
                  child: Icon(
                    Icons.shopping_cart,
                    color: currentTab == 2 ? AppColors.orangeCrusta : Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = const HomeScreen();
                      currentTab = 3;

                    });
                  },
                  child: Icon(
                    Icons.calendar_month,
                    color: currentTab == 3 ? AppColors.orangeCrusta : Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
