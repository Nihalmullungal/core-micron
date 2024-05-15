import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/settings_bloc/settings_bloc.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeUserNameTextField extends StatelessWidget {
  const ChangeUserNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final height = AppConstants.heightOfScreen(context);
    final settingsBl = BlocProvider.of<SettingsBloc>(context);
    return Form(
      key: settingsBl.usernameKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Username",
            style: FontTheme.updatingTitle,
          ),
          SizedBox(
            height: height * 0.005,
          ),
          AppConstants.textField(
              hint: "username",
              controller: settingsBl.usernameController,
              isPassword: false),
          SizedBox(
            height: height * 0.005,
          ),
        ],
      ),
    );
  }
}
