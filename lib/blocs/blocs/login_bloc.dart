import 'package:cooking_social_app/blocs/events/login_event.dart';
import 'package:cooking_social_app/blocs/states/login_state.dart';
import 'package:cooking_social_app/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  AuthService _authService;
  LoginBloc({required AuthService authService}):assert(authService != null),
    _authService = authService,
    super(LoginState.initial()){

    on<LoginEventWithGooglePressed>((event, emit) async {
      try {
        await _authService.signInWithGoogle();
        emit(LoginState.success());
      }catch (exception){
        emit(LoginState.failure());
      }

    });

    on<LoginEventWithFacebookPressed>((event, emit) async {
      try {
        await _authService.signInWithFacebook();
        emit(LoginState.success());
      }catch (exception){
        emit(LoginState.failure());
      }
    });
  }


  // @override
  // Stream<LoginState> mapEventToState(LoginEvent loginEvent) async*{
  //   final LoginState loginState;
  //   if(loginEvent is LoginEventWithGooglePressed){
  //     try {
  //       await _authService.signInWithGoogle();
  //       yield LoginState.success();
  //     }catch(exception) {
  //       yield LoginState.failure();
  //     }
  //   }else if (loginEvent is LoginEventWithFacebookPressed){
  //     try {
  //       await _authService.signInWithFacebook();
  //       yield LoginState.success();
  //     }catch(exception){
  //       yield LoginState.failure();
  //     }
  //   }
  // }

}