import 'package:cooking_social_app/screens/home/home_screen.dart';
import 'package:cooking_social_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generatorRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case home:
        return MaterialPageRoute<HomeScreen>(
            builder: (_) => const HomeScreen());
      case splash:
        return MaterialPageRoute<SplashScreen>(
            builder: (_) => const SplashScreen());
      default:
        throw const RouteException("Route not found");
    }
  }

  static const home = 'home';
  static const splash = 'splash';
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
