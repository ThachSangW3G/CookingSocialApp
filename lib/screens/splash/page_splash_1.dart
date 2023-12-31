import 'package:cooking_social_app/localization/app_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../routes/app_routes.dart';

class PageSplash1 extends StatefulWidget {
  const PageSplash1({super.key});

  @override
  State<PageSplash1> createState() => _PageSplash1State();
}

class _PageSplash1State extends State<PageSplash1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 400,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_splash_1.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteGenerator.bottom_navigation,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 30),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Colors.black),
                      child: Padding(
                        padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                        child: Center(
                          child: Text(
                            context.localize('skip'),
                            style: const TextStyle(
                                color: Colors.white, fontFamily: "CeraPro"),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 300),
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60), topRight: Radius.circular(60)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 2,
                          color: AppColors.greyBombay.withOpacity(0.5))),
                  child: const Center(
                    child: Image(
                      image: AssetImage('assets/icons/hatchef.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  context.localize('MAKERECIPESYOUROWN'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'CeraPro',
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  context.localize('splashDes1'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
