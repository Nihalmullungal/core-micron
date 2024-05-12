import 'package:coremicron/application/home_bloc/home_bloc.dart';
import 'package:coremicron/application/login_bloc/login_bloc.dart';
import 'package:coremicron/application/splash_bloc/splash_cubit.dart';
import 'package:coremicron/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashCubit(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(create: (context) => HomeScreenBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
