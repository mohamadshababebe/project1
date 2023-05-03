import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_mydical/feature/auth/data/models/errors.dart';
import 'package:my_mydical/feature/auth/domain/antites/antites.dart';
import 'package:my_mydical/feature/auth/domain/usecase/loginusecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUseCase loginUseCase;
 
  AuthBloc({required this.loginUseCase}) : super(AuthInitial()) {
    on<Authincated>((event, emit) async {
      emit(LoadingAuthState());

      try {
        String token = await loginUseCase.call(event.loginData);
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('ID_TOKENS', token);
        emit(AuthintactedState());
      } on HttpException catch (e) {
        emit(ErrorState(massage: e.toString()));
      } on Exception catch (e) {
        emit(ErrorState(massage:e.toString()));
      }
    });
  }
}
