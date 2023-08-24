import 'package:cooking_social_app/screens/account/account_person_screen.dart';
import 'package:cooking_social_app/screens/account/account_screen.dart';
import 'package:cooking_social_app/screens/account/notification_screen.dart';
import 'package:cooking_social_app/screens/authentication/login_screen.dart';
import 'package:cooking_social_app/screens/bottom_navigation/bottom_navigation.dart';
import 'package:cooking_social_app/screens/community/community.dart';
import 'package:cooking_social_app/screens/cookbook/detail_cookbook.dart';
import 'package:cooking_social_app/screens/grocery/grocery_screen.dart';
import 'package:cooking_social_app/screens/recipe%20detail/review_screen.dart';
import 'package:cooking_social_app/screens/search_recipe/search_recipe_screen.dart';
import 'package:cooking_social_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: const CommunityScreen(),
    );
  }
}
