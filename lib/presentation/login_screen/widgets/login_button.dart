import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/login_bloc/login_bloc.dart';
import 'package:coremicron/application/login_bloc/login_event.dart';
import 'package:coremicron/application/login_bloc/login_state.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:coremicron/presentation/home_screen/home_screen.dart';
import 'package:coremicron/presentation/login_screen/widgets/login_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBl = BlocProvider.of<LoginBloc>(context);
    return Column(
      children: [
        BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              AppConstants.snackBar(
                  ctx: context, message: "Login Success", isSuccess: true);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          loginBl.add(LoginClickedEvent());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(39, 140, 76, 1),
                            shape: const ContinuousRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        child: Text(
                          "Login",
                          style: FontTheme.loginText,
                        ))),
                SizedBox(
                  height: AppConstants.heightOfScreen(context) * .02,
                ),
                const LoginError()
              ],
            );
          },
        ),
        SizedBox(
          height: AppConstants.heightOfScreen(context) * .01,
        ),
      ],
    );
  }
}
