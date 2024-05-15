import 'package:coremicron/application/settings_bloc/settings_event.dart';
import 'package:coremicron/application/settings_bloc/settings_state.dart';
import 'package:coremicron/domain/company_modal.dart';
import 'package:coremicron/domain/firebase_operations.dart';
import 'package:coremicron/firebase_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitialState()) {
/////////////////// to get company details ///////////////////

    on<GetCompanyDetailsEvent>((event, emit) async {
      final companydetails = await FirebaseOperations.getCompanyDetails();
      setValue(companydetails);
      emit(GotCompanyDetailsState());
    });

////////////////////////////// to update company details //////////////////////

    on<CompanyDetailsSaveClickedEvent>((event, emit) async {
      emit(CompanyDetailscheckingState());
      if (detailsKey.currentState!.validate()) {
        final obj = CompanyModal(
            companyName: companyNameController.text.trim(),
            email: emailController.text.trim(),
            phone: phoneController.text.trim(),
            address: addressController.text.trim());
        final result = await FirebaseOperations.updateCompanydetails(obj);
        if (result) {
          emit(CompanyDetailsSaveSuccessState());
        } else {
          emit(CompanyDetailsSaveFailedState());
        }
      } else {
        emit(GotCompanyDetailsState());
      }
    });

    /////////////////////////// to change password /////////////////////////

    on<PasswordChangeClickedEvent>((event, emit) async {
      emit(PasswordCheckingState());
      if (passwordKey.currentState!.validate()) {
        final data = await FirebaseOperations.getUserandPassword();
        if (data[FirebaseConstants.password] == oldPasswordController.text) {
          if (newPasswordController.text != confirmPasswordController.text) {
            emit(PasswordMatchingFailedState());
          } else {
            final result = await FirebaseOperations.passwordChange(
                newPasswordController.text);
            if (result) {
              oldPasswordController.clear();
              newPasswordController.clear();
              confirmPasswordController.clear();
              emit(PasswordSaveSuccessState());
            } else {
              emit(PasswordSaveFailedState());
            }
          }
        } else {
          emit(OldPasswordFailedState());
        }
      } else {
        emit(GotCompanyDetailsState());
      }
    });

    ///////////////// to assign user name //////////////////////////
    on<GetUsernameEvent>(
      (event, emit) async {
        final result = await FirebaseOperations.getUserandPassword();
        usernameController.text = result[FirebaseConstants.userName].toString();
        emit(UsernameGotState());
      },
    );

    ////////////////// to change user name //////////////////////////

    on<ChangeUsernameClickedEvent>(
      (event, emit) async {
        if (usernameKey.currentState!.validate() &&
            usernameController.text.trim() != "") {
          emit(UsernamechangedCheckingState());
          final bool result = await FirebaseOperations.usernameChange(
              usernameController.text.trim());
          if (result) {
            emit(UsernamechangedSuccessState());
          } else {
            emit(UsernamechangedFailedState());
          }
        }
      },
    );
  }
  //////////////////// variables /////////////////////

  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final detailsKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();
  final usernameKey = GlobalKey<FormState>();

  ///////////////////////// functions //////////////////////
  void setValue(Map<String, String> data) {
    companyNameController.text = data[FirebaseConstants.companyName].toString();
    emailController.text = data[FirebaseConstants.email].toString();
    phoneController.text = data[FirebaseConstants.phone].toString();
    addressController.text = data[FirebaseConstants.address].toString();
  }
}
