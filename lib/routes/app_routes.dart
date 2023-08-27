import 'package:cooking_social_app/routes/fade_routes.dart';
import 'package:cooking_social_app/screens/account/account_person_screen.dart';
import 'package:cooking_social_app/screens/account/account_screen.dart';
import 'package:cooking_social_app/screens/account/editprofile_screen.dart';
import 'package:cooking_social_app/screens/account/liked_recipe_screen.dart';
import 'package:cooking_social_app/screens/account/notification_screen.dart';
import 'package:cooking_social_app/screens/authentication/login_screen.dart';
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
        return MaterialPageRoute<LoginScreen>(
            builder: (_) => const LoginScreen());

      case accountScreen:
        return FadeRoute(
            builder: (_) => const AccountScreen(), settings: settings);
      case notificationScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: NotificationScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case accountpersonScreen:
        return FadeRoute(
            builder: (_) => const AccountPerSonScreen(), settings: settings);
      case editprofileScreen:
        return FadeRoute(
            builder: (_) => const EditProfileScreen(), settings: settings);
      case likedrecipeScreen:
        return FadeRoute(
            builder: (_) => const LikedRecipeScreen(), settings: settings);
      case recipedetailScreen:
        return FadeRoute(
            builder: (_) => const RecipeDetailsScreen(), settings: settings);
      case reviewScreen:
        return FadeRoute(
            builder: (_) => const ReViewScreen(), settings: settings);

      //
      default:
        throw const RouteException("Route not found");
    }
  }

  static const home = '/';

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
