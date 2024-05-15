import 'package:coremicron/application/card_entry_bloc/card_entry_bloc.dart';
import 'package:coremicron/application/home_bloc/home_bloc.dart';
import 'package:coremicron/application/login_bloc/login_bloc.dart';
import 'package:coremicron/application/registration_bloc/regisrtation_bloc.dart';
import 'package:coremicron/application/settings_bloc/settings_bloc.dart';
import 'package:coremicron/application/splash_bloc/splash_cubit.dart';
import 'package:coremicron/firebase_options.dart';
import 'package:coremicron/presentation/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        BlocProvider(create: (context) => SettingsBloc()),
        BlocProvider(create: (context) => RegistrationBloc()),
        BlocProvider(create: (context) => CardEntryBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
