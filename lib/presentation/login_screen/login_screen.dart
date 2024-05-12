import 'package:coremicron/appconstants.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:coremicron/presentation/login_screen/widgets/login_card.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/body-bg2.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                SizedBox(
                  height: AppConstants.heightOfScreen(context) * 0.02,
                ),
                Center(
                  child: Text(
                    "Employee Progress Card",
                    style: FontTheme.heading,
                  ),
                ),
                const LoginCard(),
              ],
            ),
          ),
        ));
  }
}
