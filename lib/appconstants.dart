import 'package:coremicron/fonttheme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConstants {
  static TextFormField textField({required String hint}) {
    return TextFormField(
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
}
