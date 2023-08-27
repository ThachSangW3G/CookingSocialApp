import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    String iconData;
    title = 'New Follower';
    iconData = 'assets/icon_svg/user-follow.svg';
    if (loaiTB == 'NewFollower') {
      title = 'New Follower';
      iconData = 'assets/icon_svg/user-follow.svg';
    }
    if (loaiTB == 'Bookmarked') {
      title = 'Bookmarked';
      iconData = 'assets/icon_svg/bookmark.svg';
    }
    if (loaiTB == 'Liked') {
      title = 'Liked';
      iconData = 'assets/icon_svg/heart.svg';
    }
    if (loaiTB == 'NewReview') {
      title = 'New Review';
      iconData = 'assets/icon_svg/comment-square.svg';
    }
    if (loaiTB == 'ReviewLiked') {
      title = 'Review Liked';
      iconData = 'assets/icon_svg/thumb-up.svg';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        iconData,
                        height: 16,
                        width: 16,
                        colorFilter: const ColorFilter.mode(
                            AppColors.orangeCrusta, BlendMode.srcIn),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: kLabelTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          contextTitle,
                          style: kLabelTextStyleBigDark,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          contextDescription,
                          style: kLabelTextStyleBig,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: kLabelTextStyle,
          ),
        ],
      ),
    );
  }
}
