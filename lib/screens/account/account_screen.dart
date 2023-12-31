import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_social_app/blocs/blocs/authentication_bloc.dart';
import 'package:cooking_social_app/blocs/states/authentication_state.dart';
import 'package:cooking_social_app/components/icon_content.dart';
import 'package:cooking_social_app/components/row_content.dart';
import 'package:cooking_social_app/components/row_content_not_icon.dart';
import 'package:cooking_social_app/constants/app_color.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:cooking_social_app/models/user_model.dart';
import 'package:cooking_social_app/providers/provider_authentication/authentication_state.dart';
import 'package:cooking_social_app/providers/user_provider.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:cooking_social_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../blocs/events/authentication_event.dart';
import '../../components/line_row.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final AuthenticationStateProvider _authenticationStateProvider = Provider.of<AuthenticationStateProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.whitePorcelain,
      body: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Account',
            textAlign: TextAlign.center,
            style: TextStyle(
                // color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Recoleta'),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                // color: Colors.black,
                size: 20,
              )),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(16.0), child: LineRow()),
        ),
        body: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  children: [
                    FutureBuilder<UserModel>(
                      future: userProvider.getUser(user.uid),
                      builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final userModel = snapshot.data;
    
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  RouteGenerator.accountpersonScreen,
                                  arguments: user.uid
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userModel!.name,
                                      style: const TextStyle(
                                          // color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "CeraPro"),
                                    ),
                                    Text(userModel.email, style: kLabelTextStyle)
                                  ],
                                ),
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              userModel.avatar),
                                          fit: BoxFit.contain)),
                                ),
                              ],
                            ),
                          );
                        }
    
                      }
    
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const LineRow()
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
                          iconData: 'assets/icon_svg/heart.svg',
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteGenerator.likedrecipeScreen);
                          }),
                      IconContent(
                          label: 'Notifications',
                          iconData: 'assets/icon_svg/bell.svg',
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteGenerator.notificationScreen);
                          }),
                      IconContent(
                          label: 'Settings',
                          iconData: 'assets/icon_svg/equalizer.svg',
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteGenerator.settingScreen);
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const LineRow()
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
                          // color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Recoleta'),
                    ),
                    RowContent(label: 'Abount', onTap: () {
                      Navigator.pushNamed(context, RouteGenerator.aboutScreen);
                      
                    }),
                    RowContent(label: 'Help & Support', onTap: () {
                      Navigator.pushNamed(context, RouteGenerator.helpsupportScreen);

                    }),
                    RowContent(label: 'Send FeedBack', onTap: () {
                      Navigator.pushNamed(context, RouteGenerator.sendfeedbackScreen);

                    }),
                    RowContent(label: 'Rate Us', onTap: () {
                      Navigator.pushNamed(context, RouteGenerator.rateusScreen);

                    }),
                    RowContent(label: 'Check For Update', onTap: () {
                      Navigator.pushNamed(context, RouteGenerator.checkforupdateScreen);

                    }),
                    RowContentNotIcon(
                      label: 'Logout',
                      onTap: () async {
                        print(_authenticationStateProvider.getUID);
                        try {
                          await _authenticationStateProvider.signOut();
                          Navigator.pushNamed(context, RouteGenerator.login);
  
                        }catch (e){}
  
  
                    })
                  ],
                ),
              )
            ])
      ),
    );
  }
}
