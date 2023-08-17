import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../models/cookbook.dart';

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