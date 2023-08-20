import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class PageSplash2 extends StatefulWidget {
  const PageSplash2({super.key});

  @override
  State<PageSplash2> createState() => _PageSplash2State();
}

class _PageSplash2State extends State<PageSplash2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 400,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_splash_2.jpg'),
                  fit: BoxFit.cover)),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        color: Colors.black
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                      child: Center(
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "CeraPro"
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
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 2,
                          color: AppColors.greyBombay.withOpacity(0.5)
                      )
                  ),
                  child: const Center(
                    child: Image(
                      image: AssetImage('assets/icons/hatchef.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                const Text(
                  'ALL IN ONE PLACE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w600,
                      fontSize: 25,

                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Storing your recipes in Mallika allows you to quickly search, find, and select what you want to cook.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'CeraPro',
                      fontWeight: FontWeight.w400,
                      fontSize: 16
                  ),

                )
              ],
            ),
          ),
        )
      ],
    );
  }
}