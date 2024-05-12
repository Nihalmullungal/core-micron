import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final loginbl = BlocProvider.of<LoginBloc>(context);
    return Form(
      key: loginbl.formKey,
      child: Column(
        children: [
          AppConstants.textField(
              hint: "User Name",
              controller: loginbl.userController,
              isPassword: false),
          SizedBox(
            height: AppConstants.heightOfScreen(context) * .02,
          ),
          AppConstants.textField(
              isPassword: true,
              hint: "Password",
              controller: loginbl.passwordController),
          SizedBox(
            height: AppConstants.heightOfScreen(context) * .02,
          ),
        ],
      ),
    );
  }
}
