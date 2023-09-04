import 'package:cooking_social_app/screens/authentication/authentication_screen.dart';
import 'package:cooking_social_app/screens/authentication/login_screen.dart';
import 'package:cooking_social_app/screens/bottom_navigation/bottom_navigation.dart';
import 'package:cooking_social_app/screens/community/community.dart';
import 'package:cooking_social_app/screens/cookbook/detail_cookbook.dart';

import 'package:cooking_social_app/screens/home/home_screen.dart';
import 'package:cooking_social_app/screens/splash/splash_screen.dart';

import 'package:cooking_social_app/screens/account/account_person_screen.dart';
import 'package:cooking_social_app/screens/account/account_screen.dart';
import 'package:cooking_social_app/screens/account/editprofile_screen.dart';
import 'package:cooking_social_app/screens/account/liked_recipe_screen.dart';
import 'package:cooking_social_app/screens/account/notification_screen.dart';
import 'package:cooking_social_app/screens/recipe_detail/recipe_details_screen.dart';
import 'package:cooking_social_app/screens/recipe_detail/review_screen.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generatorRoute(RouteSettings settings) {
    final args = settings.arguments;
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
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: DetailCookBookScreen())),
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

      // case login:
      //   return PageTransition(
      //     child: const SafeArea(child: SafeArea(child: LoginScreen())),
      //     type: PageTransitionType.fade,
      //     duration: const Duration(milliseconds: 400),
      //   );
      case authentication:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: AuthenticationScreen())),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 400),
        );

      case accountScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: AccountScreen())),
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
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: RecipeDetailsScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case reviewScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: ReViewScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );

      //

      default:
        throw const RouteException("Route not found");
    }
  }

  static const splash = 'splash';

  static const home = 'home';
  static const detailCookbook = 'detailCookbook';
  static const community = 'community';
  static const bottom_navigation = 'bottom_navigation';
  static const login = 'login';
  static const authentication = 'authentication';

  // ACCOUNT
  static const accountScreen = 'account';
  static const notificationScreen = 'notification';
  static const accountpersonScreen = 'accountperson';
  static const editprofileScreen = 'editprofile';
  static const likedrecipeScreen = 'likedrecipe';
  //

  // RECIPE DETAILS
  static const recipedetailScreen = 'recipedetail';
  static const reviewScreen = 'review';
  //
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
