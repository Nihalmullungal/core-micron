import 'package:coremicron/application/registration_bloc/regisrtation_bloc.dart';
import 'package:coremicron/application/registration_bloc/registration_event.dart';
import 'package:coremicron/application/registration_bloc/registration_state.dart';
import 'package:coremicron/firebase_constants.dart';
import 'package:coremicron/fonttheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConstants {
  static TextFormField textField(
      {required String hint,
      required TextEditingController controller,
      required bool isPassword,
      int? maxLines,
      Function(String)? onchange}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "required ";
        }
        return null;
      },
      onChanged: onchange,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: FontTheme.hintStyle,
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(0))),
    );
  }

  static double heightOfScreen(BuildContext ctx) {
    return MediaQuery.of(ctx).size.height;
  }

  static double widthOfScreen(BuildContext ctx) {
    return MediaQuery.of(ctx).size.width;
  }

  static void setSharedPreferences(bool val) async {
    final shared = await SharedPreferences.getInstance();
    shared.setBool("login", val);
  }

  static Future<bool> getSharedpreferences() async {
    final shared = await SharedPreferences.getInstance();
    return shared.getBool("login") ?? false;
  }

  static snackBar(
      {required BuildContext ctx,
      required String message,
      required bool isSuccess}) {
    return ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: isSuccess ? Colors.green : Colors.red,
    ));
  }

  static ButtonStyle? buttonStyle = ElevatedButton.styleFrom(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: const Color.fromRGBO(2, 46, 68, 1));

  static showBottomModalForCategory(BuildContext ctx, bool isEdit,
      [String? id, String? oldName]) {
    final regBl = BlocProvider.of<RegistrationBloc>(ctx);
    return showBottomSheet(
      context: ctx,
      builder: (context) {
        final height = heightOfScreen(ctx);
        final width = widthOfScreen(ctx);
        return Form(
          key: regBl.addCategoryKey,
          child: Container(
            height: height * .54,
            decoration: BoxDecoration(color: Colors.yellow[50]),
            child: Column(
              children: [
                Container(
                  height: height * .07,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 192, 239, 1)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: height * .02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Category",
                          style: FontTheme.modalSheetHeading,
                        ),
                        IconButton(
                            onPressed: () {
                              regBl.clearAllCategoryController();
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 20,
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FirebaseConstants.category,
                        style: FontTheme.updatingTitle,
                      ),
                      textField(
                          hint: "",
                          controller: regBl.categoryController,
                          isPassword: false),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("color", style: FontTheme.updatingTitle),
                          Text("Lower Limit", style: FontTheme.updatingTitle),
                          Text("Higher Limit", style: FontTheme.updatingTitle)
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            color: Colors.grey,
                            height: height * 0.035,
                            width: width * .2,
                            child: Center(
                                child: Text(
                              "Grey",
                              style: FontTheme.loginText,
                            )),
                          ),
                          SizedBox(
                            width: width * 0.018,
                          ),
                          Expanded(
                            child: textField(
                                hint: "",
                                controller: regBl.greyLowerController,
                                isPassword: false),
                          ),
                          SizedBox(
                            width: width * 0.018,
                          ),
                          Expanded(
                            child: textField(
                                hint: "",
                                controller: regBl.greyHigherController,
                                isPassword: false),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            color: Colors.red,
                            height: height * 0.035,
                            width: width * .2,
                            child: Center(
                                child: Text(
                              "Red",
                              style: FontTheme.loginText,
                            )),
                          ),
                          SizedBox(
                            width: width * 0.018,
                          ),
                          Expanded(
                            child: textField(
                                hint: "",
                                controller: regBl.redLowerController,
                                isPassword: false),
                          ),
                          SizedBox(
                            width: width * 0.018,
                          ),
                          Expanded(
                            child: textField(
                                hint: "",
                                controller: regBl.redHigherController,
                                isPassword: false),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            color: Colors.yellow,
                            height: height * 0.035,
                            width: width * .2,
                            child: Center(
                                child: Text(
                              "Yellow",
                              style: FontTheme.loginText,
                            )),
                          ),
                          SizedBox(
                            width: width * 0.018,
                          ),
                          Expanded(
                            child: textField(
                                hint: "",
                                controller: regBl.yellowLowerController,
                                isPassword: false),
                          ),
                          SizedBox(
                            width: width * 0.018,
                          ),
                          Expanded(
                            child: textField(
                                hint: "",
                                controller: regBl.yellowHigherController,
                                isPassword: false),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            color: Colors.green,
                            height: height * 0.035,
                            width: width * .2,
                            child: Center(
                                child: Text(
                              "Green",
                              style: FontTheme.loginText,
                            )),
                          ),
                          SizedBox(
                            width: width * 0.018,
                          ),
                          Expanded(
                            child: textField(
                                hint: "",
                                controller: regBl.greenLowerController,
                                isPassword: false),
                          ),
                          SizedBox(
                            width: width * 0.018,
                          ),
                          Expanded(
                            child: textField(
                                hint: "",
                                controller: regBl.greenHigherController,
                                isPassword: false),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      BlocConsumer<RegistrationBloc, RegistrationState>(
                        listener: (context, state) {
                          if (state is NewCategorySaveSuccessState) {
                            snackBar(
                                ctx: ctx, message: "success", isSuccess: true);
                            Navigator.of(context).pop();
                          } else if (state is NewCategorySaveFailedState) {
                            snackBar(
                                ctx: ctx, message: "failed", isSuccess: false);
                          }
                        },
                        builder: (context, state) {
                          if (state is NewCategoryCheckingState) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<RegistrationBloc>(context)
                                      .add(isEdit
                                          ? NewCategoryEditSaveClickedEvent(
                                              id: id.toString(),
                                              oldName: oldName.toString())
                                          : NewCategoryAddClickedEvent());
                                },
                                style: AppConstants.buttonStyle,
                                child: Text(
                                  "Add",
                                  style: FontTheme.loginText,
                                ));
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static showBottoModalForEmployee(BuildContext ctx, bool isEdit,
      [String? id]) {
    return showBottomSheet(
      context: ctx,
      builder: (context) {
        final regBl = BlocProvider.of<RegistrationBloc>(context);
        final height = heightOfScreen(ctx);
        return Container(
          height: height * .34,
          decoration: BoxDecoration(color: Colors.yellow[50]),
          child: Form(
            key: regBl.addEmployeeKey,
            child: Column(
              children: [
                Container(
                  height: height * .07,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 192, 239, 1)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: height * .02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Employee",
                          style: FontTheme.modalSheetHeading,
                        ),
                        IconButton(
                            onPressed: () {
                              regBl.clearAllEmployeeCategory();
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 20,
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height * .02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FirebaseConstants.employeeName,
                        style: FontTheme.updatingTitle,
                      ),
                      textField(
                          hint: "",
                          controller: regBl.employeeController,
                          isPassword: false),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        FirebaseConstants.phone,
                        style: FontTheme.updatingTitle,
                      ),
                      textField(
                          hint: "",
                          controller: regBl.phoneController,
                          isPassword: false),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      BlocConsumer<RegistrationBloc, RegistrationState>(
                        listener: (context, state) {
                          if (state is NewEmployeeSaveSuccessState) {
                            snackBar(
                                ctx: ctx, message: "Success", isSuccess: true);
                          } else if (state is NewEmployeeSaveFailedState) {
                            snackBar(
                                ctx: ctx, message: "failed", isSuccess: false);
                          }
                        },
                        builder: (context, state) {
                          if (state is NewEmployeeCheckingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<RegistrationBloc>(context)
                                      .add(isEdit
                                          ? NewEmployeeEditSaveClickedEvent(
                                              id: id.toString())
                                          : NewEmployeeAddClickedEvent());
                                },
                                style: AppConstants.buttonStyle,
                                child: Text(
                                  "Add",
                                  style: FontTheme.loginText,
                                ));
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
