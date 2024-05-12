import 'dart:async';
import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/login_bloc/login_event.dart';
import 'package:coremicron/application/login_bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitalState()) {
    on<LoginClickedEvent>((event, emit) async {
      isValidating = true;
      if (formKey.currentState!.validate()) {
        isLoginFailed = false;
        emit(LoginCheckingState());
        await Future.delayed(const Duration(seconds: 2), () {
          if (userController.text.trim().toString().toLowerCase() == "admin" &&
              passwordController.text.trim() == "123") {
            isValidating = true;
            emit(LoginRedirectingState());
            Timer(const Duration(milliseconds: 1500), () {
              AppConstants.setSharedPreferences(true);
            });
            emit(LoginSuccessState());
          } else {
            isValidating = false;
            isLoginFailed = true;
            emit(LoginFailedState());
          }
        });
      } else {
        isLoginFailed = false;
        emit(LoginUserErrorState());
        isValidating = false;
      }
    });
  }
  /////////////// variables ////////////////////////
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoginFailed = false;
  bool isValidating = false;
}
