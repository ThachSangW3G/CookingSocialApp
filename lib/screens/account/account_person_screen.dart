import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class AccountPerSonScreen extends StatefulWidget {
  const AccountPerSonScreen({super.key});

  @override
  State<AccountPerSonScreen> createState() => _AccountPerSonScreenState();
}

class _AccountPerSonScreenState extends State<AccountPerSonScreen> {
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
                        height: 200,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: AppColors.white,
                        ),
                        child: const Padding(
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
                                  Text('24', style: kLabelTextStyleBig),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text('Followers', style: kLabelTextStyleBig),
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
                                  Text('8', style: kLabelTextStyleBig),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text('Following', style: kLabelTextStyle)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
                        color: Colors.white, // Màu và độ mờ của đổ bóng
                        spreadRadius: 5, // Bán kính mở rộng của đổ bóng
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
