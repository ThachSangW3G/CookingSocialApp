import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState extends Equatable{
  const AuthenticationState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthenticationStateInitial extends AuthenticationState{}
class AuthenticationStateSuccess extends AuthenticationState{
  final User user;
  const AuthenticationStateSuccess({required this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
class AuthenticationStateFailure extends AuthenticationState{}