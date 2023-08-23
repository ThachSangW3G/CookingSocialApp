import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String loaiTB;
  final String time;
  final String contextTitle;
  final String contextDescription;
  const NotificationItem(
      {super.key,
      required this.loaiTB,
      required this.time,
      required this.contextTitle,
      required this.contextDescription});

  @override
  Widget build(BuildContext context) {
    String title;
    IconData iconData;
    title = 'New Follower';
    iconData = Icons.follow_the_signs_rounded;
    if (loaiTB == 'NewFollower') {
      title = 'New Follower';
      iconData = Icons.supervisor_account_outlined;
    }
    if (loaiTB == 'Bookmarked') {
      title = 'Bookmarked';
      iconData = Icons.bookmark_border;
    }
    if (loaiTB == 'Liked') {
      title = 'Liked';
      iconData = Icons.favorite_border_outlined;
    }
    if (loaiTB == 'NewReview') {
      title = 'New Review';
      iconData = Icons.comment_outlined;
    }
    if (loaiTB == 'ReviewLiked') {
      title = 'Review Liked';
      iconData = Icons.thumb_up_alt_outlined;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  children: [
                    Icon(
                      iconData,
                      color: AppColors.orangeCrusta,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
              ),
              Text(
                time,
                style: kLabelTextStyle,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 33),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contextTitle,
                    style: kReviewLabelTextStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    contextDescription,
                    style: kLabelTextStyle,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
