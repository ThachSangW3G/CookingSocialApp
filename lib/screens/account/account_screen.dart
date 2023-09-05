import 'package:cooking_social_app/blocs/blocs/authentication_bloc.dart';
import 'package:cooking_social_app/blocs/states/authentication_state.dart';
import 'package:cooking_social_app/components/icon_content.dart';
import 'package:cooking_social_app/components/row_content.dart';
import 'package:cooking_social_app/components/row_content_not_icon.dart';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:cooking_social_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/events/authentication_event.dart';
import '../../components/line_row.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: 20,
            )),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(16.0), child: LineRow()),
      ),
      body: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(authService: _authService),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, authenticationState){
            return Column(children: [
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
                                context, RouteGenerator.accountpersonScreen);
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
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Recoleta'),
                    ),
                    RowContent(label: 'Abount', onTap: () {}),
                    RowContent(label: 'Help & Support', onTap: () {}),
                    RowContent(label: 'Send FeedBack', onTap: () {}),
                    RowContent(label: 'Rate Us', onTap: () {}),
                    RowContent(label: 'Check For Update', onTap: () {}),
                    RowContentNotIcon(
                        label: 'Logout',
                        onTap: () {
                          //BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationEventLoggedOut());
                          AuthService().signOut();
                          print(AuthService().getUserID);
                        })
                  ],
                ),
              )
            ]);
          },

        ),
      ),
    );
  }
}
