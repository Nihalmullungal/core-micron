import 'dart:async';
import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/login_bloc/login_event.dart';
import 'package:coremicron/application/login_bloc/login_state.dart';
import 'package:coremicron/domain/firebase_operations.dart';
import 'package:coremicron/firebase_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitalState()) {
    on<LoginClickedEvent>((event, emit) async {
      if (formKey.currentState!.validate()) {
        isValidating = true;
        isLoginFailed = false;
        emit(LoginCheckingState());
        final loginDetails = await FirebaseOperations.getUserandPassword();
        await Future.delayed(const Duration(seconds: 2), () async {
          if (userController.text.trim().toString().toLowerCase() ==
                  loginDetails[FirebaseConstants.userName] &&
              passwordController.text.trim() ==
                  loginDetails[FirebaseConstants.password]) {
            emit(LoginRedirectingState());
            await Future.delayed(const Duration(milliseconds: 1500), () {
              AppConstants.setSharedPreferences(true);
            });
            emit(LoginSuccessState());
            isValidating = false;
            userController.clear();
            passwordController.clear();
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
