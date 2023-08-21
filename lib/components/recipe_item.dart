import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:flutter/material.dart';

import 'line_row.dart';
import '../constants/app_color.dart';

class RecipeItem extends StatelessWidget {
  final String time;
  final String name;
  const RecipeItem({super.key, required this.time, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/avatar.jpg'),
                        fit: BoxFit.contain)),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "CeraPro"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50, top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.access_time_outlined,
                              color: AppColors.greyBombay,
                              size: 22,
                            ),
                            Text(
                              time,
                              style: kReviewLabelTextStyle,
                            ),
                            const Text(
                              'min',
                              style: kReviewLabelTextStyle,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Image(
                              image: AssetImage('assets/icons/tray.png'),
                              width: 21,
                              height: 21,
                              color: AppColors.greyBombay,
                            ),
                            const Text(
                              'Easy',
                              style: kReviewLabelTextStyle,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              PopupMenuButton(
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  const PopupMenuItem(
                    child: Text('Item 1'),
                  ),
                  const PopupMenuItem(
                    child: Text('Item 2'),
                  ),
                  const PopupMenuItem(
                    child: Text('Item 3'),
                  ),
                ],
              )
            ],
          ),
        ),
        const LineRow(),
      ],
    );
  }
}
