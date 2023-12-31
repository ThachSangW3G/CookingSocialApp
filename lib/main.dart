// import 'package:cooking_social_app/screens/authentication/login_screen.dart';
// import 'package:cooking_social_app/screens/recipe/add_grocery_screen.dart';
import 'package:cooking_social_app/localization/localization_delegate.dart';
import 'package:cooking_social_app/providers/adddata_provider/intro_provider.dart';
import 'package:cooking_social_app/providers/adddata_provider/material_provider.dart';
import 'package:cooking_social_app/providers/adddata_provider/spice_provder.dart';
import 'package:cooking_social_app/providers/adddata_provider/steps_provider.dart';
import 'package:cooking_social_app/providers/calendar_provider.dart';
import 'package:cooking_social_app/providers/category_provider.dart';
import 'package:cooking_social_app/providers/cookbook_provider.dart';
import 'package:cooking_social_app/providers/follow_provider.dart';
import 'package:cooking_social_app/providers/grocery_provider.dart';
import 'package:cooking_social_app/providers/like_cookbook_provider.dart';
import 'package:cooking_social_app/providers/like_provider.dart';
import 'package:cooking_social_app/providers/like_review_provider.dart';
import 'package:cooking_social_app/providers/notification_provider.dart';
import 'package:cooking_social_app/providers/provider_authentication/authentication_state.dart';
import 'package:cooking_social_app/providers/provider_language/language_provider.dart';

import 'package:cooking_social_app/providers/provider_recipe/recipe_state.dart';
import 'package:cooking_social_app/providers/provider_recipe/review_state.dart';

import 'package:cooking_social_app/providers/provider_authentication/recipe_provider.dart';
import 'package:cooking_social_app/providers/provider_theme/theme_provider.dart';
import 'package:cooking_social_app/providers/recent_search_provider.dart';
import 'package:cooking_social_app/providers/user_provider.dart';

import 'package:cooking_social_app/routes/app_routes.dart';
import 'package:cooking_social_app/screens/authentication/authentication_screen.dart';
import 'package:cooking_social_app/screens/authentication/login_screen.dart';
import 'package:cooking_social_app/screens/bottom_navigation/bottom_navigation.dart';
import 'package:cooking_social_app/screens/calendar/calendar_screen.dart';
import 'package:cooking_social_app/screens/grocery/grocery_screen.dart';
import 'package:cooking_social_app/screens/home/home_screen.dart';
import 'package:cooking_social_app/screens/recipe/recipe_add_screen.dart';
import 'package:cooking_social_app/screens/recipe/recipe_edit_screen.dart';
import 'package:cooking_social_app/screens/recipe_detail/recipe_details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      ChangeNotifierProvider(
        create: (_) => RecipeProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => CategoryProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => CookbookProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
      ),
      ChangeNotifierProvider(create: (_) => RecipeStateProvider()),
      ChangeNotifierProvider(create: (_) => ReviewStateProvider()),
      ChangeNotifierProvider(
          create: (_) =>
              RecentSearchProvider(FirebaseAuth.instance.currentUser!.uid)),
      ChangeNotifierProvider(create: (_) => LikeProvider()),
      ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ChangeNotifierProvider(create: (_) => FollowProvider()),
      ChangeNotifierProvider(create: (_) => LikeReviewProvider()),

      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ChangeNotifierProvider(create: (_) => StepsProvider()),
      ChangeNotifierProvider(create: (_) => SpiceProvider()),
      ChangeNotifierProvider(create: (_) => MaterialProvider()),
      ChangeNotifierProvider(create: (_) => IntroProvider()),
      ChangeNotifierProvider(create: (_) => LikeCookbookProvider()),
      ChangeNotifierProvider(create: (_) => CalendarProvider()),
      ChangeNotifierProvider(create: (_) => GroceryProvider()),
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
    // final ThemeProvider themeProvider = 
    //   Provider.of<ThemeProvider>(context, listen: true);
    return Consumer<ThemeProvider>(
      builder: (BuildContext context, ThemeProvider themeProvider, _) { 
        return Consumer<LanguageProvider>(
          builder: (BuildContext context, LanguageProvider languageProvider, _) {  
            return MaterialApp(
              title: 'Cooking Social',
              debugShowCheckedModeBanner: false,
              // theme: ThemeData(
                // colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
                // useMaterial3: true,
              // ),
              theme: themeProvider.themeData,
              onGenerateRoute: RouteGenerator.generatorRoute,
              locale: languageProvider.currentLocale,
              localizationsDelegates: const [
                AppLocalizationDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales:const [
                Locale.fromSubtags(languageCode: "en"),
                Locale.fromSubtags(languageCode: "vi"),
              ],
              home: authenticationStateProvider.isLoggedIn
                  ? const BottomNavigation()
                  : const LoginScreen(),
              //home: RecipeEditScreen(),
            );
          },
        );
      },
    );
  }
}

