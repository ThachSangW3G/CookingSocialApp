
// import 'package:cooking_social_app/screens/authentication/login_screen.dart';
// import 'package:cooking_social_app/screens/recipe/add_grocery_screen.dart';
import 'package:cooking_social_app/screens/calendar/calendar_screen.dart';
import 'package:cooking_social_app/screens/recipe/recipe_add_screen.dart';
import 'package:cooking_social_app/localization/app_localization.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:cooking_social_app/screens/account/account_screen.dart';
import 'package:cooking_social_app/screens/account/editprofile_screen.dart';
import 'package:cooking_social_app/screens/recipe/recipe_edit_screen.dart';
import 'package:cooking_social_app/screens/recipe_detail/recipe_details_screen.dart';
import 'package:cooking_social_app/screens/recipe_detail/review_screen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

      onGenerateRoute: RouteGenerator.generatorRoute,
      home: const EditProfileScreen(),

    );
  }
}
