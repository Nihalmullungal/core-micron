import 'package:coremicron/application/splash_bloc/splash_cubit.dart';
import 'package:coremicron/application/splash_bloc/splash_state.dart';
import 'package:coremicron/presentation/home_screen/home_screen.dart';
import 'package:coremicron/presentation/login_screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashSuccessState) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false);
          } else if (state is SplashFailedState) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
          }
        },
        child: const Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
