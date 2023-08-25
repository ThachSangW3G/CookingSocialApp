import 'package:cooking_social_app/components/notification_item.dart';
import 'package:flutter/material.dart';

import '../../components/line_row.dart';
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
          'Notifications',
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
            LineRow(),
            NotificationItem(
                loaiTB: 'NewFollower',
                time: '1 min ago',
                contextTitle: 'Yeay you got new follower',
                contextDescription: 'Nararaya Susanti has follow you'),
            NotificationItem(
                loaiTB: 'Bookmarked',
                time: '1 min ago',
                contextTitle: 'Yeay you got new follower',
                contextDescription: 'Nararaya Susanti has follow you'),
            NotificationItem(
                loaiTB: 'Liked',
                time: '1 min ago',
                contextTitle: 'Yeay you got new follower',
                contextDescription: 'Nararaya Susanti has follow you'),
            NotificationItem(
                loaiTB: 'NewReview',
                time: '1 min ago',
                contextTitle: 'Yeay you got new follower',
                contextDescription: 'Nararaya Susanti has follow you'),
            NotificationItem(
                loaiTB: 'ReviewLiked',
                time: '1 min ago',
                contextTitle: 'Yeay you got new follower',
                contextDescription: 'Nararaya Susanti has follow you')
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 40,
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
