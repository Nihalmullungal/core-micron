import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/settings_bloc/settings_bloc.dart';
import 'package:coremicron/application/settings_bloc/settings_event.dart';
import 'package:coremicron/application/settings_bloc/settings_state.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCompanyButton extends StatelessWidget {
  const UpdateCompanyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is CompanyDetailsSaveSuccessState) {
          AppConstants.snackBar(
              ctx: context, message: "Updated successfully", isSuccess: true);
        } else if (state is CompanyDetailsSaveFailedState) {
          AppConstants.snackBar(
              ctx: context, message: "Failed to update", isSuccess: false);
        }
      },
      builder: (context, state) {
        if (state is CompanyDetailscheckingState) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<SettingsBloc>(context)
                      .add(CompanyDetailsSaveClickedEvent());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 17, 31),
                    shape: const ContinuousRectangleBorder()),
                child: Text(
                  "Save",
                  style: FontTheme.loginText,
                )),
          );
        }
      },
    );
  }
}
