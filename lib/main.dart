// import 'package:cooking_social_app/screens/authentication/login_screen.dart';
// import 'package:cooking_social_app/screens/recipe/add_grocery_screen.dart';
import 'package:cooking_social_app/providers/provider_authentication/authentication_state.dart';
import 'package:cooking_social_app/providers/provider_recipe/recipe_state.dart';
import 'package:cooking_social_app/providers/provider_recipe/review_state.dart';
import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:cooking_social_app/screens/authentication/authentication_screen.dart';
import 'package:cooking_social_app/screens/authentication/login_screen.dart';
import 'package:cooking_social_app/screens/home/home_screen.dart';
import 'package:cooking_social_app/screens/recipe_detail/recipe_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthenticationStateProvider(),
      ),
      ChangeNotifierProvider(create: (_) => RecipeStateProvider()),
      ChangeNotifierProvider(create: (_) => ReviewStateProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AuthenticationStateProvider authenticationStateProvider =
        Provider.of<AuthenticationStateProvider>(context, listen: false);
    return MaterialApp(
      title: 'Cooking Social',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      onGenerateRoute: RouteGenerator.generatorRoute,
      home: authenticationStateProvider.isLoggedIn
          ? const HomeScreen()
          : const LoginScreen(),
    );
  }
}
