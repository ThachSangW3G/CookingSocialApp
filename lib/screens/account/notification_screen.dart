import 'package:cooking_social_app/components/one_notification.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whitePorcelain,
        centerTitle: true,
        title: const Text(
          'NotiFications',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Recoleta'),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: 20,
            )),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Clear',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: AppColors.orangeCrusta,
                  fontSize: 18,
                  fontFamily: 'CeraPro'),
            ),
          )
        ],
      ),
      backgroundColor: AppColors.whitePorcelain,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              thickness: 0.7,
              color: AppColors.greyBombay,
            ),
            OneNotification(
                loaiTB: 'NewFollower',
                time: '1 min ago',
                contextTitle: 'Yeay you got new follower',
                contextDescription: 'Nararaya Susanti has follow you'),
            OneNotification(
                loaiTB: 'Bookmarked',
                time: '1 min ago',
                contextTitle: 'Yeay you got new follower',
                contextDescription: 'Nararaya Susanti has follow you'),
            OneNotification(
                loaiTB: 'Liked',
                time: '1 min ago',
                contextTitle: 'Yeay you got new follower',
                contextDescription: 'Nararaya Susanti has follow you'),
            OneNotification(
                loaiTB: 'NewReview',
                time: '1 min ago',
                contextTitle: 'Yeay you got new follower',
                contextDescription: 'Nararaya Susanti has follow you'),
            OneNotification(
                loaiTB: 'ReviewLiked',
                time: '1 min ago',
                contextTitle: 'Yeay you got new follower',
                contextDescription: 'Nararaya Susanti has follow you')
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 40,
        margin: const EdgeInsets.all(70),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.appYellow),
          onPressed: () {},
          child: const Center(
            child: Text(
              'Mark all as Read',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
