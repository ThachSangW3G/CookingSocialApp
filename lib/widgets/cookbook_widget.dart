import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_social_app/providers/provider_theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../constants/app_color.dart';
import '../models/cookbook.dart';

class CookBookWidget extends StatelessWidget {
  final CookBook cookBook;
  const CookBookWidget({
    super.key, required this.cookBook,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final isLightTheme = themeProvider.isLightTheme;
    return Container(
      height: 500,
      width: double.infinity,
      decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: isLightTheme ? Colors.white : AppColors.appCircleButtonColor,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), // Màu và độ mờ của đổ bóng
              spreadRadius: 10, // Bán kính mở rộng của đổ bóng
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
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)
                ),
                child: CachedNetworkImage(
                  imageUrl: cookBook.image,
                  fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.04),
                        ),
                      );
                    },
                ),
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
                      color: isLightTheme ? 
                      // Color.fromARGB(179, 255, 255, 255) 
                      Colors.white
                      : Colors.black54,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.5), // Màu và độ mờ của đổ bóng
                          spreadRadius: 0.1, // Bán kính mở rộng của đổ bóng
                          blurRadius: 0.1, // Độ mờ của đổ bóng
                          offset: const Offset(0, 1), // Vị trí của đổ bóng trong hệ tọa độ (x, y)
                        )
                      ]
                  ),

                  //Box con
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
                          cookBook.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'CeraPro',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              cookBook.likes.toString(),
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
                              cookBook.recipes.length.toString(),
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