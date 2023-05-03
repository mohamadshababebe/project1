part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}
class LoadingAuthState extends AuthState {}

class AuthintactedState extends AuthState {}



class ErrorState extends AuthState {
  String massage;
  ErrorState({required this.massage});
}
