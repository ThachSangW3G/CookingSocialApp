import 'package:cooking_social_app/blocs/events/authentication_event.dart';
import 'package:cooking_social_app/blocs/states/authentication_state.dart';
import 'package:cooking_social_app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>{
  final AuthService _authService;
  AuthenticationBloc({required AuthService authService}):assert (authService != null),
    _authService = authService,
    super(AuthenticationStateInitial()){
    on<AuthenticationEventStarted>((event, emit) async {
      final isSignedIn = await _authService.isSignedIn();
      if (isSignedIn) {
        final user = await _authService.getUser();
        emit(AuthenticationStateSuccess(user: user));
      } else {
        emit(AuthenticationStateFailure());
      }
    });

    on<AuthenticationEventLoggedIn>((event, emit) async {
      emit(AuthenticationStateSuccess(user: await _authService.getUser()));
    });


    on<AuthenticationEventLoggedOut>((event, emit) async {
      _authService.signOut();
      print('12345654');
      emit(AuthenticationStateFailure());
    });
  }

  // @override
  // Stream<AuthenticationState> mapEventToState(AuthenticationEvent authenticationEvent) async*{
  //    if (authenticationEvent is AuthenticationEventLoggedIn) {
  //     yield AuthenticationStateSuccess(user: await _authService.getUser());
  //   } else if (authenticationEvent is AuthenticationEventLoggedOut){
  //     _authService.signOut();
  //     yield AuthenticationStateFailure();
  //   }
  // }
}