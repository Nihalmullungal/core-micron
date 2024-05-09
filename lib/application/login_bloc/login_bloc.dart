import 'package:coremicron/application/login_bloc/login_event.dart';
import 'package:coremicron/application/login_bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitalState()) {
    on<LoginClickedEvent>((event, emit) {});
  }
  /////////////// variables ////////////////////////
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
