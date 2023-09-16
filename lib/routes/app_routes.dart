import 'package:cooking_social_app/blocs/blocs/authentication_bloc.dart';
import 'package:cooking_social_app/models/cookbook.dart';
import 'package:cooking_social_app/screens/authentication/authentication_screen.dart';
import 'package:cooking_social_app/screens/authentication/login_screen.dart';
import 'package:cooking_social_app/screens/bottom_navigation/bottom_navigation.dart';
import 'package:cooking_social_app/screens/calendar/calendar_screen.dart';
import 'package:cooking_social_app/screens/community/community.dart';
import 'package:cooking_social_app/screens/cookbook/detail_cookbook.dart';

import 'package:cooking_social_app/screens/home/home_screen.dart';
import 'package:cooking_social_app/screens/recipe/add_grocery_screen.dart';
import 'package:cooking_social_app/screens/recipe/recipe_add_screen.dart';
import 'package:cooking_social_app/screens/recipe/recipe_edit_screen.dart';
import 'package:cooking_social_app/screens/splash/splash_screen.dart';

import 'package:cooking_social_app/screens/account/account_person_screen.dart';
import 'package:cooking_social_app/screens/account/account_screen.dart';
import 'package:cooking_social_app/screens/account/editprofile_screen.dart';
import 'package:cooking_social_app/screens/account/liked_recipe_screen.dart';
import 'package:cooking_social_app/screens/account/notification_screen.dart';
import 'package:cooking_social_app/screens/recipe_detail/recipe_details_screen.dart';
import 'package:cooking_social_app/screens/recipe_detail/review_screen.dart';
import 'package:cooking_social_app/services/auth_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generatorRoute(RouteSettings settings) {
    final args = settings.arguments;
    final AuthService _authService = AuthService();
    switch (settings.name) {
      case home:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: HomeScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );

      case splash:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: SplashScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );

      case detailCookbook:
        CookBook cookbook = args as CookBook;
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: DetailCookBookScreen(
            cookbook: cookbook,
          ))),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 400),
        );

      case community:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: CommunityScreen())),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 400),
        );

      case bottom_navigation:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: BottomNavigation())),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 400),
        );

      case login:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: LoginScreen())),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 400),
        );
      case authentication:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: AuthenticationScreen())),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 400),
        );

      // case accountScreen:
      //   return PageTransition(
      //     child: const SafeArea(child: SafeArea(child: AccountScreen())),
      //     type: PageTransitionType.rightToLeft,
      //     duration: const Duration(milliseconds: 400),
      //   );

      case accountScreen:
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(authService: _authService),
            child: const AccountScreen(),
          ))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );

      case notificationScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: NotificationScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case accountpersonScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: AccountPerSonScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case editprofileScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: EditProfileScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case likedrecipeScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: LikedRecipeScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case recipedetailScreen:
        String key = args as String;
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: RecipeDetailsScreen(
            keyRecipe: key,
          ))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case reviewScreen:
        String keyRecipe = args as String;
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: ReViewScreen(
            keyRecipe: keyRecipe,
          ))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case recipeeditScreen:
        // String keyRecipe = args as String;
        return PageTransition(
          child: const SafeArea(
              child: SafeArea(
                  child: RecipeEditScreen(
              // keyRecipe: keyRecipe,
          ))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case recipeaddgroceryScreen:
        return PageTransition(
          child: const SafeArea(
              child: SafeArea(
                  child: AddGroceryScreen(
          ))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case recipeaddScreen:
        return PageTransition(
          child: const SafeArea(
              child: SafeArea(
                  child: RecipeAddScreen(
          ))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case calendarScreen:
        return PageTransition(
          child: const SafeArea(
              child: SafeArea(
                  child: CalendarScreen(
          ))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );

      //

      default:
        throw const RouteException("Route not found");
    }
  }

  static const splash = '/splash';

  static const home = '/home';
  static const detailCookbook = '/detailCookbook';
  static const community = '/community';
  static const bottom_navigation = '/bottom_navigation';
  static const login = '/login';
  static const authentication = '/authentication';

  // ACCOUNT
  static const accountScreen = '/account';
  static const notificationScreen = '/notification';
  static const accountpersonScreen = '/accountperson';
  static const editprofileScreen = '/editprofile';
  static const likedrecipeScreen = '/likedrecipe';
  //

  // RECIPE DETAILS
  static const recipedetailScreen = '/recipedetail';
  static const reviewScreen = '/review';
  
  //RECIPE EDIT
  static const recipeeditScreen = '/recipededit';
  static const recipeaddgroceryScreen = '/recipeeditaddgrocery';

  //RECIPE ADD
  static const recipeaddScreen = '/recipeadd';

  //GROCERY
  static const groceryScreen = '/grocery';

  //CALENDAR
  static const calendarScreen = '/calendar';
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
