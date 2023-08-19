import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:flutter/material.dart';

class OneReView extends StatelessWidget {
  final String name;
  final String time;
  final String content;
  final bool check;
  const OneReView(
      {super.key,
      required this.name,
      required this.time,
      required this.content,
      required this.check});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 30,
            width: 30,
            padding: const EdgeInsets.only(top: 5),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/avatar.jpg'),
                    fit: BoxFit.contain)),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "CeraPro",
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  time,
                  style: kLabelTextStyle,
                ),
                Text(
                  content,
                  style: kReviewLabelTextStyle,
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: check == false
                  ? const Icon(
                      Icons.favorite_border_outlined,
                      color: AppColors.greyBombay,
                      size: 30,
                    )
                  : const Icon(
                      Icons.favorite_sharp,
                      color: Colors.red,
                      size: 30,
                    )),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[],
          )
        ],
      ),
    );
  }
}
