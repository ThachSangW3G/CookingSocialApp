import 'package:flutter/material.dart';

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generatorRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case home:
      // return MaterialPageRoute<InputScreen>(
      //     builder: (_) => const InputScreen());
      case splash:
      // return MaterialPageRoute<SplashScreen>(
      //     builder: (_) => const SplashScreen());
      default:
        throw const RouteException("Route not found");
    }
  }

  static const home = '/';
  static const splash = 'splash';
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
