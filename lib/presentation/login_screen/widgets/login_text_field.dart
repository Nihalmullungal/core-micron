import 'package:coremicron/appconstants.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({super.key});

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  AppConstants.textField(hint: "User Name"),
                  SizedBox(
                    height: AppConstants.heightOfScreen(context) * .02,
                  ),
                  AppConstants.textField(hint: "Password"),
                  SizedBox(
                    height: AppConstants.heightOfScreen(context) * .02,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(39, 140, 76, 1),
                              shape: const ContinuousRectangleBorder()),
                          child: Text(
                            "Login",
                            style: FontTheme.loginText,
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
