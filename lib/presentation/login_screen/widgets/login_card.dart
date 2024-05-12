import 'package:coremicron/appconstants.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:coremicron/presentation/login_screen/widgets/login_button.dart';
import 'package:coremicron/presentation/login_screen/widgets/login_text_field.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: AppConstants.heightOfScreen(context) * .02, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 11, top: 3),
              height: AppConstants.heightOfScreen(context) * 0.03,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(245, 245, 245, 1),
                  border: Border(
                      bottom: BorderSide(color: Colors.black.withOpacity(.5))),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(5))),
              child: Text(
                "Please Sign In",
                style: FontTheme.signInText,
              ),
            ),
            SizedBox(
              height: AppConstants.heightOfScreen(context) * .02,
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [LoginTextField(), LoginButton()],
                )),
          ],
        ),
      ),
    );
  }
}
