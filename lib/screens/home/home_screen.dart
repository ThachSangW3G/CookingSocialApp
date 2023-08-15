import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/models/cookbook.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageController _pageController = PageController();
  int pageCount = 3;
  int pageCurrent = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitePorcelain,
      body:   Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/avatar.jpg'),
                              fit: BoxFit.contain
                            )
                          ),

                        ),
                        const SizedBox(width: 20,),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi Nararaya',
                              style: TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(
                              'Why are you cooking today?',
                              style: TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: const Icon(
                        Icons.notifications_outlined,
                        size: 30,
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Cookbooks',
                      style: TextStyle(
                        fontFamily: 'Recoleta',
                        fontSize: 24,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          pageCurrent.toString(),
                          style: const TextStyle(
                            fontFamily: 'CeraPro',
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          '/',
                          style: TextStyle(
                            fontFamily: 'CeraPro',
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          pageCount.toString(),
                          style: const TextStyle(
                            fontFamily: 'CeraPro',
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                Container(

                  color: AppColors.whitePorcelain,
                  height: 500,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        pageCurrent = index + 1;
                      });
                    },
                    controller: _pageController,
                    itemCount: cookBookList.length,
                    itemBuilder: (context, index){
                      return CookBookWidget(cookBook: cookBookList[index],);
                    },
                  ),
                ),
                const SizedBox(height: 15,),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: cookBookList.length,
                  effect: const SwapEffect(
                    activeDotColor: AppColors.orangeCrusta,
                    dotWidth: 10,
                    dotHeight: 10
                  ),
                )

              ],
            ),
          ),
        )
      ),
    );
  }
}

class CookBookWidget extends StatelessWidget {
  final CookBook cookBook;
  const CookBookWidget({
    super.key, required this.cookBook,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), // Màu và độ mờ của đổ bóng
            spreadRadius: 2, // Bán kính mở rộng của đổ bóng
            blurRadius: 5, // Độ mờ của đổ bóng
            offset: const Offset(0, 3), // Vị trí của đổ bóng trong hệ tọa độ (x, y)
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(cookBook.image),
                  fit: BoxFit.cover
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12)
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 160),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.5), // Màu và độ mờ của đổ bóng
                          spreadRadius: 0.1, // Bán kính mở rộng của đổ bóng
                          blurRadius: 0.1, // Độ mờ của đổ bóng
                          offset: const Offset(0, 1), // Vị trí của đổ bóng trong hệ tọa độ (x, y)
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Container(
                          height: 50,
                          width: 50,
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
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          cookBook.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Recoleta',
                            fontSize: 25,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          cookBook.describe,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'CeraPro',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              cookBook.like.toString(),
                              style: const TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 18,

                              ),
                            ),
                            const Text(
                              'Likes',
                              style: TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 18,

                              ),
                            ),
                            const Text(
                              '|',
                              style: TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 30,
                                color: AppColors.greyBombay

                              ),
                            ),
                            Text(
                              cookBook.recipe.toString(),
                              style: const TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 18,

                              ),
                            ),
                            const Text(
                              'Recipes',
                              style: TextStyle(
                                fontFamily: 'CeraPro',
                                fontSize: 18,

                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
