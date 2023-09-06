import 'package:cooking_social_app/blocs/blocs/login_bloc.dart';
import 'package:cooking_social_app/blocs/states/authentication_state.dart';
import 'package:cooking_social_app/screens/authentication/login_screen.dart';
import 'package:cooking_social_app/screens/home/home_screen.dart';
import 'package:cooking_social_app/screens/splash/splash_screen.dart';
import 'package:cooking_social_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs/authentication_bloc.dart';
import '../../blocs/events/authentication_event.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(authService: _authService)..add(AuthenticationEventStarted()),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, authenticationState){
          if (authenticationState is AuthenticationStateSuccess){
            return const SplashScreen();
          } else if(authenticationState is AuthenticationStateFailure){
            return BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(authService: _authService),
              child: const LoginScreen(),
            );
          }
          return const SplashScreen();
        },
      ),
    );
  }
}
