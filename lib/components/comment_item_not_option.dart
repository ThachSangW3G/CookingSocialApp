import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:cooking_social_app/models/like_review.dart';
import 'package:cooking_social_app/models/review.dart';
import 'package:cooking_social_app/providers/like_review_provider.dart';
import 'package:cooking_social_app/providers/provider_recipe/review_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CommentItemNotOption extends StatefulWidget {
  final Review review;
  const CommentItemNotOption({super.key, required this.review});

  @override
  State<CommentItemNotOption> createState() => _CommentItemNotOptionState();
}

class _CommentItemNotOptionState extends State<CommentItemNotOption> {
  Review? review;
  bool check = false;
  bool first = true;
  @override
  void initState() {
    review = widget.review;
    check = review!.check;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(review?.name);
    final LikeReviewProvider reviewLikeProvider =
        Provider.of<LikeReviewProvider>(context);

    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 33,
          width: 33,
          padding: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(review!.avatar), fit: BoxFit.fill)),
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
                review!.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "CeraPro",
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                review!.time,
                style: kLabelTextStyle,
              ),
              Text(
                review!.description,
                style: kReviewLabelTextStyle,
              )
            ],
          ),
        ),
        FutureBuilder<LikeReview>(
            future: reviewLikeProvider.likeExist(review!.key, uid!),
            builder: (context, snapshot) {
              final LikeReview? liked = snapshot.data;
              if (liked != null && first) {
                check = true;
                first = false;
              }
              return Container(
                padding: EdgeInsets.zero,
                child: Row(children: [
                  GestureDetector(
                    onTap: () async {
                      if (!check) {
                        setState(() {
                          check = true;
                          LikeReview likeReview = LikeReview(
                              id: DateTime.now().toIso8601String(),
                              idUser: uid,
                              idReview: review!.key,
                              time: Timestamp.now());
                          reviewLikeProvider.addLike(likeReview);
                          Provider.of<ReviewStateProvider>(context,
                                  listen: false)
                              .updatePropertyById(review!.key, 'check', true);
                          //reviewProvider.update(review);
                        });
                      } else {
                        await reviewLikeProvider.deleteLike(liked!);
                        setState(() {
                          check = false;
                          Provider.of<ReviewStateProvider>(context,
                                  listen: false)
                              .updatePropertyById(review!.key, 'check', false);
                        });
                      }
                    },
                    child: check == false
                        ? SvgPicture.asset(
                            'assets/icon_svg/heart.svg',
                            colorFilter: const ColorFilter.mode(
                                AppColors.greyBombay, BlendMode.srcIn),
                            height: 24,
                            width: 24,
                          )
                        : SvgPicture.asset(
                            'assets/icon_svg/heart_orange.svg',
                            colorFilter: const ColorFilter.mode(
                                AppColors.orangeCrusta, BlendMode.srcIn),
                            height: 24,
                            width: 24,
                          ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // SvgPicture.asset(
                  //   'assets/icon_svg/options.svg',
                  //   colorFilter: const ColorFilter.mode(
                  //       AppColors.greyBombay, BlendMode.srcIn),
                  //   height: 24,
                  //   width: 24,
                  // ),
                ]),
              );
            }),
      ],
    );
  }
}
