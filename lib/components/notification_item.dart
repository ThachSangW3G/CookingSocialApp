import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:cooking_social_app/models/recipe_cookbook.dart';
import 'package:cooking_social_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final UserModel userOwner;
  final UserModel userGuest;
  final Recipe? recipe;
  const NotificationItem(
      {super.key,
      required this.notification,
      required this.userOwner,
      required this.userGuest,
      required this.recipe});

  @override
  Widget build(BuildContext context) {
    String? contextTitle;
    String? contextDescription;
    String? title;
    String iconData;

    iconData = 'assets/icon_svg/user-follow.svg';
    if (notification.type == 'newFollower') {
      title = 'New Follower';
      contextTitle = 'Yeay you got new follower!';
      contextDescription = '${userGuest.name} has follow you';
      iconData = 'assets/icon_svg/user-follow.svg';
    }
    // if (notification.type == 'Bookmarked') {
    //   title = 'Bookmarked';
    //   iconData = 'assets/icon_svg/bookmark.svg';
    // }
    else if (notification.type == 'liked') {
      title = 'Liked';
      contextTitle = '${userGuest.name} like your recipe';
      contextDescription = "";
      iconData = 'assets/icon_svg/heart.svg';
    } else if (notification.type == 'newReview') {
      title = 'New Review';
      contextTitle = 'New review on ${recipe!.name} recipe';
      contextDescription =
          '${userGuest.name} write a review "${notification.title}" to your recipe';
      iconData = 'assets/icon_svg/comment-square.svg';
    }
    // if (type == 'ReviewLiked') {
    //   title = 'Review Liked';
    //   iconData = 'assets/icon_svg/thumb-up.svg';
    // }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: notification.read ? Colors.white12 : AppColors.oldLace,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: SizedBox(
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title!,
                            style: kLabelTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            contextTitle!,
                            style: kLabelTextStyleBigDark,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            contextDescription!,
                            style: kLabelTextStyleBig,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Flexible(
            flex: 1,
            child: Text(
              "timem",
              style: kLabelTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
