import 'package:coremicron/appconstants.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';

class NewEmployee extends StatelessWidget {
  const NewEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    final height = AppConstants.heightOfScreen(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: height * 0.008),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    AppConstants.showBottoModalForEmployee(context, false);
                  },
                  style: AppConstants.buttonStyle,
                  child: Text("New Employee", style: FontTheme.loginText)),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.002,
        ),
      ],
    );
  }
}
