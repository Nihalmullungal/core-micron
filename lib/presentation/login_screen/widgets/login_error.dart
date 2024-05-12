import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/login_bloc/login_bloc.dart';
import 'package:coremicron/application/login_bloc/login_state.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginError extends StatelessWidget {
  const LoginError({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBl = BlocProvider.of<LoginBloc>(context);
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            Visibility(
                visible: loginBl.isLoginFailed,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, top: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                  height: AppConstants.heightOfScreen(context) * .04,
                  width: double.infinity,
                  child: Text(
                    "Login Failed!!...",
                    style: FontTheme.loginText,
                  ),
                )),
            Visibility(
                visible: loginBl.isValidating,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CupertinoActivityIndicator(),
                    state is LoginCheckingState
                        ? Text(
                            "Validating",
                            style: FontTheme.validatingText,
                          )
                        : Text(
                            "redirecting",
                            style: FontTheme.redirectingText,
                          ),
                  ],
                ))
          ],
        );
      },
    );
  }
}
