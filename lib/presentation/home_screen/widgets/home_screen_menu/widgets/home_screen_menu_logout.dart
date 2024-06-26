import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/home_bloc/home_bloc.dart';
import 'package:coremicron/application/home_bloc/home_event.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:coremicron/presentation/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenMenuLogout extends StatelessWidget {
  const HomeScreenMenuLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: (AppConstants.widthOfScreen(context) * 0.01)),
      child: TextButton(
          onPressed: () {
            AppConstants.setSharedPreferences(false);
            BlocProvider.of<HomeScreenBloc>(context)
                .add(HomeMenuClickedEvent());
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
          },
          child: Text(
            "LOGOUT",
            style: FontTheme.expansionTileText,
          )),
    );
  }
}
