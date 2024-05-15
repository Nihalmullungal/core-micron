import 'package:coremicron/appconstants.dart';
import 'package:coremicron/application/settings_bloc/settings_bloc.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCompanyDetailsTextField extends StatelessWidget {
  const UpdateCompanyDetailsTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final settingBl = BlocProvider.of<SettingsBloc>(context);
    final height = AppConstants.heightOfScreen(context);
    return Padding(
      padding: EdgeInsets.only(top: height * 0.02),
      child: Form(
        key: settingBl.detailsKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Company Name",
              style: FontTheme.updatingTitle,
            ),
            SizedBox(
              height: height * 0.005,
            ),
            AppConstants.textField(
                hint: "company Name",
                maxLines: 1,
                controller: settingBl.companyNameController,
                isPassword: false),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              "Email",
              style: FontTheme.updatingTitle,
            ),
            SizedBox(
              height: height * 0.005,
            ),
            AppConstants.textField(
                maxLines: 1,
                hint: "email ",
                controller: settingBl.emailController,
                isPassword: false),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              "Phone",
              style: FontTheme.updatingTitle,
            ),
            SizedBox(
              height: height * 0.005,
            ),
            AppConstants.textField(
                maxLines: 1,
                hint: "phone ",
                controller: settingBl.phoneController,
                isPassword: false),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              "Address",
              style: FontTheme.updatingTitle,
            ),
            SizedBox(
              height: height * 0.005,
            ),
            AppConstants.textField(
                maxLines: null,
                hint: "address ",
                controller: settingBl.addressController,
                isPassword: false),
          ],
        ),
      ),
    );
  }
}
