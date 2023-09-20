import 'package:cooking_social_app/blocs/blocs/authentication_bloc.dart';
import 'package:cooking_social_app/models/cookbook.dart';
import 'package:cooking_social_app/models/recipe.dart';
import 'package:cooking_social_app/screens/account/setting/interface_setting_screen.dart';
import 'package:cooking_social_app/screens/account/setting/language_setting_screen.dart';
import 'package:cooking_social_app/screens/account/setting/notification_setting_screen.dart';
import 'package:cooking_social_app/screens/account/setting/setting_screen.dart';
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
import 'package:cooking_social_app/screens/recipe_detail/webview_screen.dart';
import 'package:cooking_social_app/screens/splash/splash_screen.dart';

import 'package:cooking_social_app/screens/account/account_person_screen.dart';
import 'package:cooking_social_app/screens/account/account_screen.dart';
import 'package:cooking_social_app/screens/account/editprofile_screen.dart';
import 'package:cooking_social_app/screens/account/liked_recipe_screen.dart';
import 'package:cooking_social_app/screens/account/notification_screen.dart';
import 'package:cooking_social_app/screens/recipe_detail/recipe_details_screen.dart';
import 'package:cooking_social_app/screens/recipe_detail/review_screen.dart';
import 'package:cooking_social_app/services/auth_service.dart';
import 'package:cooking_social_app/widgets/add_cookbook.dart';

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
      case settingScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: SettingScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case interfacesettingScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: InterfaceSettingScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case notisettingScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: NotiSettingScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case languagesettingScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: LanguageSettingScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case accountpersonScreen:
        String idUser = args as String;
        return PageTransition(
          child: SafeArea(child: SafeArea(child: AccountPerSonScreen(idUser: idUser,))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case editprofileScreen:
       String idUser = args as String;
        return PageTransition(
          child: SafeArea(child: SafeArea(child: EditProfileScreen(idUser: idUser,))),
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
      case webviewScreen:
        String url = args as String;
        return PageTransition(
          child: SafeArea(child: SafeArea(child: NewsWebViewPage(url: url))),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case reviewScreen:
        Recipe recipe = args as Recipe;
        return PageTransition(
          child: SafeArea(
              child: SafeArea(
                  child: ReViewScreen(
            recipe: recipe,
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
          child: const SafeArea(child: SafeArea(child: AddGroceryScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case recipeaddScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: RecipeAddScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );
      case calendarScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: CalendarScreen())),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 400),
        );

      case addCookbookScreen:
        return PageTransition(
          child: const SafeArea(child: SafeArea(child: AddCookbookScreen())),
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
  
  //SETTINGS
  static const settingScreen = 'settings';
  static const interfacesettingScreen = 'interfacesetting';
  static const notisettingScreen = 'nitificationssetting';
  static const languagesettingScreen = 'languagesetting';

  // RECIPE DETAILS
  static const recipedetailScreen = '/recipedetail';
  static const reviewScreen = '/review';
  static const webviewScreen = '/webview';

  //RECIPE EDIT
  static const recipeeditScreen = '/recipededit';
  static const recipeaddgroceryScreen = '/recipeeditaddgrocery';

  //RECIPE ADD
  static const recipeaddScreen = '/recipeadd';

  //GROCERY
  static const groceryScreen = '/grocery';

  //CALENDAR
  static const calendarScreen = '/calendar';

  static const addCookbookScreen = '/add_cookbook';
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
