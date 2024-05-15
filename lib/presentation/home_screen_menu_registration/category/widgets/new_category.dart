import 'package:coremicron/appconstants.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';

class NewCategory extends StatelessWidget {
  const NewCategory({super.key});

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
                    AppConstants.showBottomModalForCategory(context, false);
                  },
                  style: AppConstants.buttonStyle,
                  child: Text("New Category", style: FontTheme.loginText)),
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
