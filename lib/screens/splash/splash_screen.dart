import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/screens/splash/page_splash_1.dart';
import 'package:cooking_social_app/screens/splash/page_splash_2.dart';
import 'package:cooking_social_app/screens/splash/page_splash_3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children:
          [
            PageView(
              controller: _pageController,
              children: const [
                PageSplash1(),
                PageSplash2(),
                PageSplash3(),
              ],

            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 700),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: SwapEffect(
                        activeDotColor: AppColors.orangeCrusta
                      ),
                  ),
                ],
              ),
            )
          ]
      ),
    );
  }
}
