import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/settings_bloc/settings_bloc.dart';
import 'package:coremicron/application/settings_bloc/settings_event.dart';
import 'package:coremicron/application/settings_bloc/settings_state.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeUsernameButton extends StatelessWidget {
  const ChangeUsernameButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is UsernamechangedCheckingState) {
          return const CircularProgressIndicator();
        } else {
          return ElevatedButton(
              onPressed: () {
                BlocProvider.of<SettingsBloc>(context)
                    .add(ChangeUsernameClickedEvent());
              },
              style: AppConstants.buttonStyle,
              child: Text(
                "Update",
                style: FontTheme.loginText,
              ));
        }
      },
      listener: (context, state) {
        if (state is UsernamechangedSuccessState) {
          AppConstants.snackBar(
              ctx: context,
              message: "Username changed successfully",
              isSuccess: true);
        } else if (state is UsernamechangedFailedState) {
          AppConstants.snackBar(
              ctx: context, message: "something went wrong", isSuccess: false);
        }
      },
    );
  }
}
