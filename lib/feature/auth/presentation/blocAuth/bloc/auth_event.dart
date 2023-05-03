part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class Authincated extends AuthEvent {
  LoginData loginData;
  Authincated({required this.loginData});
  List<Object> get props => [loginData];
}
