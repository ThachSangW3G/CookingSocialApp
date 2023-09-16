class LoginState{
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  LoginState({required this.isSubmitting, required this.isSuccess, required this.isFailure});

  factory LoginState.initial(){
    return LoginState(
      isSubmitting: false,
      isSuccess: false,
      isFailure: false
    );
  }

  factory LoginState.loading(){
    return LoginState(isSubmitting: true, isSuccess: false, isFailure: false);
  }

  factory LoginState.failure(){
    return LoginState(isSubmitting: false, isSuccess: false, isFailure: false);
  }

  factory LoginState.success(){
    return LoginState(isSubmitting: false, isSuccess: true, isFailure: false);
  }
}