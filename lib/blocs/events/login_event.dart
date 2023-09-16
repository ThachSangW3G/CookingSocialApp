import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{
  const LoginEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class LoginEventWithGooglePressed extends LoginEvent{}
class LoginEventWithFacebookPressed extends LoginEvent{}