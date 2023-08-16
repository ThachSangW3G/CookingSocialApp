import 'package:cooking_social_app/components/icon_content.dart';
import 'package:cooking_social_app/components/row_content.dart';
import 'package:cooking_social_app/components/row_content_not_icon.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whitePorcelain,
        centerTitle: true,
        title: const Text(
          'Account',
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
      body: Column(children: [
        const Divider(
          thickness: 0.7,
          color: AppColors.greyBombay,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nararaya Kiana',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: "CeraPro"),
                      ),
                      Text('trungtinh1620@gmail.com', style: kLabelTextStyle)
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/avatar.jpg'),
                            fit: BoxFit.contain)),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 0.7,
                color: AppColors.greyBombay,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconContent(
                    label: 'Liked Recipe',
                    iconData: Icons.favorite_border_outlined,
                    onTap: () {}),
                IconContent(
                    label: 'Notifications',
                    iconData: Icons.notifications_on_outlined,
                    onTap: () {}),
                IconContent(
                    label: 'Settings', iconData: Icons.settings, onTap: () {}),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.7,
              color: AppColors.greyBombay,
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'General',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'Recoleta'),
              ),
              RowContent(label: 'Abount', onTap: () {}),
              RowContent(label: 'Help & Support', onTap: () {}),
              RowContent(label: 'Send FeedBack', onTap: () {}),
              RowContent(label: 'Rate Us', onTap: () {}),
              RowContent(label: 'Check For Update', onTap: () {}),
              RowContentNotIcon(label: 'Logout', onTap: () {})
            ],
          ),
        )
      ]),
    );
  }
}
