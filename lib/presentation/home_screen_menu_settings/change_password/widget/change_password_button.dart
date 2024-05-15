import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/settings_bloc/settings_bloc.dart';
import 'package:coremicron/application/settings_bloc/settings_event.dart';
import 'package:coremicron/application/settings_bloc/settings_state.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is PasswordMatchingFailedState) {
          AppConstants.snackBar(
              ctx: context, message: "Password not Matching", isSuccess: false);
        } else if (state is PasswordSaveFailedState) {
          AppConstants.snackBar(
              ctx: context, message: "Something went wrong", isSuccess: false);
        } else if (state is OldPasswordFailedState) {
          AppConstants.snackBar(
              ctx: context, message: "wrong old password", isSuccess: false);
        } else if (state is PasswordSaveSuccessState) {
          AppConstants.snackBar(
              ctx: context,
              message: "Password Updated Successfully",
              isSuccess: true);
        }
      },
      builder: (context, state) {
        if (state is PasswordCheckingState) {
          return const CircularProgressIndicator();
        } else {
          return ElevatedButton(
              onPressed: () {
                BlocProvider.of<SettingsBloc>(context)
                    .add(PasswordChangeClickedEvent());
              },
              style: AppConstants.buttonStyle,
              child: Text(
                "save",
                style: FontTheme.loginText,
              ));
        }
      },
    );
  }
}
