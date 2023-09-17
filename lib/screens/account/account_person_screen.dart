import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_social_app/components/line_row.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:cooking_social_app/models/user_model.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:cooking_social_app/widgets/post_widget.dart';
import 'package:cooking_social_app/widgets/reviews_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/app_color.dart';
import '../../models/featured.dart';
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
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final user = FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final bool isOwner = user.uid ==  widget.idUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: FutureBuilder<UserModel>(
          future: userProvider.getUser(widget.idUser),
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
                          GestureDetector(
                            onTap: () {
                              if(isOwner){
                                Navigator.pushNamed(
                                    context, RouteGenerator.editprofileScreen);
                              }else{

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
                                      isOwner ? 'assets/icon_svg/pencil.svg' : 'assets/icon_svg/user-follow.svg',
                                      height: 25,
                                      width: 25,
                                      color: AppColors.greyShuttle,
                                    ),
                                  )),
                            ),
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
                                            Text('24', style: kLabelTextStyle),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text('Followers',
                                                style: kLabelTextStyle),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              '|',
                                              style: TextStyle(
                                                  fontFamily: 'CeraPro',
                                                  fontSize: 30,
                                                  color: AppColors.greyIron),
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text('8', style: kLabelTextStyle),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text('Following',
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
