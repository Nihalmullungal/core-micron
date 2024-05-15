import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/settings_bloc/settings_bloc.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordTextField extends StatelessWidget {
  const ChangePasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsBl = BlocProvider.of<SettingsBloc>(context);
    final height = AppConstants.heightOfScreen(context);
    return Padding(
      padding: EdgeInsets.only(top: height * 0.02),
      child: Form(
        key: settingsBl.passwordKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Old Password",
              style: FontTheme.updatingTitle,
            ),
            SizedBox(
              height: height * 0.005,
            ),
            AppConstants.textField(
                hint: "",
                controller: settingsBl.oldPasswordController,
                isPassword: true,
                maxLines: 1),
            Text(
              "New Password",
              style: FontTheme.updatingTitle,
            ),
            SizedBox(
              height: height * 0.005,
            ),
            AppConstants.textField(
                hint: "",
                controller: settingsBl.newPasswordController,
                isPassword: true,
                maxLines: 1),
            Text(
              "Confirm password",
              style: FontTheme.updatingTitle,
            ),
            SizedBox(
              height: height * 0.005,
            ),
            AppConstants.textField(
                hint: "",
                controller: settingsBl.confirmPasswordController,
                isPassword: true,
                maxLines: 1),
          ],
        ),
      ),
    );
  }
}
