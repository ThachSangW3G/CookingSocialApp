import 'package:cooking_social_app/components/comment_item.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class ReViewScreen extends StatefulWidget {
  const ReViewScreen({super.key});

  @override
  State<ReViewScreen> createState() => _ReViewScreenState();
}

class _ReViewScreenState extends State<ReViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whitePorcelain,
        centerTitle: true,
        title: const Text(
          'Reviews',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Recoleta'),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: 20,
            )),
      ),
      backgroundColor: AppColors.whitePorcelain,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const CommentItem(
                name: 'Nguyen Trung Tinh',
                time: '4 day ago',
                content: 'San Pham Rat Dep Luohhhhhhhhhhhhhhhhhhhhhhhhhhhhhn',
                check: false),
            Column(
              children: [
                const Divider(
                  thickness: 0.7,
                  color: AppColors.greyBombay,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 224, 222, 222)),
                          child: TextField(
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              hintText: 'Your Review',
                              hintStyle: TextStyle(color: AppColors.greyDark),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(
                              color: AppColors.orangeCrusta,
                              fontFamily: 'CeraPro',
                              fontSize: 23),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ]),
    );
  }
}
