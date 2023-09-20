import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_social_app/components/line_row.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:cooking_social_app/models/follow_model.dart';
import 'package:cooking_social_app/models/user_model.dart';
import 'package:cooking_social_app/providers/follow_provider.dart';
import 'package:cooking_social_app/providers/notification_provider.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:cooking_social_app/widgets/list_cookbook_widget.dart';
import 'package:cooking_social_app/widgets/post_widget.dart';
import 'package:cooking_social_app/widgets/reviews_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/app_color.dart';
import '../../models/featured.dart';
import '../../models/notification_model.dart';
import '../../providers/user_provider.dart';
import '../../widgets/featured_card_widget.dart';

class AccountPerSonScreen extends StatefulWidget {
  final String idUser;
  const AccountPerSonScreen({super.key, required this.idUser});

  @override
  State<AccountPerSonScreen> createState() => _AccountPerSonScreenState();
}

class _AccountPerSonScreenState extends State<AccountPerSonScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late Future<UserModel> _userModelFuture;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _userModelFuture = Provider.of<UserProvider>(context, listen: false).getUser(widget.idUser);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final user = FirebaseAuth.instance.currentUser!;
  String iconFollow = 'assets/icon_svg/user-follow.svg';


  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final FollowProvider followProvider = Provider.of<FollowProvider>(context);
    final NotificationProvider notificationProvider = Provider.of<NotificationProvider>(context);
    final bool isOwner = user.uid ==  widget.idUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: FutureBuilder<UserModel>(
          future: _userModelFuture,
          builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot){

            if(snapshot.connectionState == ConnectionState.waiting){
              return Container(
                height: MediaQuery.of(context).size.height,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator()
                    ]
                ),
              );
            }
            else {
              final userModel = snapshot.data;

              return Stack(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/image_background.png'),
                            fit: BoxFit.fill)),
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: AppColors.black,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                          FutureBuilder<FollowModel>(
                            future: followProvider.followExist(userModel!.uid, user.uid),
                            builder: (context, snapshot){
                              final existFollow = snapshot.data;
                              return GestureDetector(
                                onTap: () {
                                  if(isOwner){
                                    Navigator.pushNamed(
                                        context, RouteGenerator.editprofileScreen);
                                  }else{

                                    if(existFollow == null){
                                      FollowModel follow = FollowModel(
                                          id: DateTime.now().toIso8601String(),
                                          idUserOwner: userModel!.uid,
                                          idUserFollower: user.uid
                                      );
                                      followProvider.addFollow(follow);

                                      NotificationModel notification = NotificationModel(
                                          id: DateTime.now().toIso8601String(),
                                          idUserGuest: user.uid,
                                          idUserOwner: userModel.uid,
                                          time: Timestamp.now(),
                                          type: 'newFollower',
                                          read: false,
                                          title: "",
                                          idRecipe: ""
                                      );

                                      notificationProvider.addNotification(notification);

                                    }else {
                                      followProvider.deleteFollow(existFollow);
                                    }


                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        child: SvgPicture.asset(
                                          isOwner ? 'assets/icon_svg/pencil.svg' : existFollow == null ? 'assets/icon_svg/user-follow.svg' : 'assets/icon_svg/group.svg',
                                          height: 25,
                                          width: 25,
                                          color: AppColors.greyShuttle,
                                        ),
                                      )),
                                ),
                              );
                            }
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 240),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 190,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width - 40,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15)),
                                color: AppColors.white,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        Text(
                                          userModel!.name,
                                          style: const TextStyle(
                                            fontFamily: 'Recoleta',
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                            userModel.bio,
                                            textAlign: TextAlign.center,
                                            softWrap: true,
                                            overflow: TextOverflow.clip,
                                            style: kLabelTextStyle),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            FutureBuilder<int>(future: followProvider.getFollower(userModel.uid), builder: (context, snapshot){

                                              if(snapshot.connectionState == ConnectionState.waiting){
                                                return const Text('0', style: kLabelTextStyle);
                                              }else {
                                                final follower = snapshot.data;
                                                return Text(follower.toString(), style: kLabelTextStyle);
                                              }
                                            }),

                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            const Text('Followers',
                                                style: kLabelTextStyle),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            const Text(
                                              '|',
                                              style: TextStyle(
                                                  fontFamily: 'CeraPro',
                                                  fontSize: 30,
                                                  color: AppColors.greyIron),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            FutureBuilder<int>(future: followProvider.getFollowing(userModel.uid), builder: (context, snapshot){

                                              if(snapshot.connectionState == ConnectionState.waiting){
                                                return const Text('0', style: kLabelTextStyle);
                                              }else {
                                                final follower = snapshot.data;
                                                return Text(follower.toString(), style: kLabelTextStyle);
                                              }
                                            }),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            const Text('Following',
                                                style: kLabelTextStyle)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: TabBar(
                                controller: _tabController,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    25.0,
                                  ),
                                  color: AppColors.orangeCrusta,
                                ),
                                labelColor: Colors.white,
                                unselectedLabelColor: AppColors.greyShuttle,
                                dividerColor: Colors.white,
                                tabs: [
                                  Tab(
                                    child: Container(
                                      width: 280,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Posts',
                                        style: TextStyle(
                                            fontFamily: 'CeraPro',
                                            fontSize: 17),
                                      ),
                                    ),
                                  ),

                                  Tab(
                                    child: Container(
                                      width: 280,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Cookbooks',
                                        style: TextStyle(
                                            fontFamily: 'CeraPro',
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),


                                  // second tab [you can add an icon using the icon property]
                                  Tab(
                                    child: Container(
                                      width: 280,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Reviews',
                                        style: TextStyle(
                                            fontFamily: 'CeraPro',
                                            fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const LineRow(),
                            SizedBox(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height,
                              width: double.infinity,
                              child: TabBarView(
                                  controller: _tabController,
                                  children: const [
                                    PostWidget(),
                                    ListCookbookWidget(),
                                    ReviewWidget()
                                  ]),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 190),
                    width: double.infinity,
                    height: 90,
                    alignment: Alignment.center,
                    child: Container(
                      height: 90,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  userModel!.avatar),
                              fit: BoxFit.contain),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: 5,
                              blurRadius: 0.1,
                              offset: Offset(0, 1),
                            )
                          ]),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
