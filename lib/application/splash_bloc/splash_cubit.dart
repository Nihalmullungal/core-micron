import 'dart:async';

import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/splash_bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitialState()) {
    Timer(const Duration(seconds: 4), () async {
      final isLogin = await AppConstants.getSharedpreferences();

      if (isLogin) {
        emit(SplashSuccessState());
      } else {
        emit(SplashFailedState());
      }
    });
  }
}
