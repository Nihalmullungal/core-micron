import 'package:flutter/material.dart';

class FontTheme {
  static TextStyle heading = const TextStyle(
      fontFamily: "sans",
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static TextStyle hintStyle = TextStyle(
      fontFamily: "sans",
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.black.withOpacity(0.3));

  static TextStyle loginText = const TextStyle(
      fontSize: 12,
      fontFamily: "sans",
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static TextStyle signInText = const TextStyle(
      fontFamily: "sans", fontWeight: FontWeight.w600, color: Colors.black);
  static TextStyle validatingText = const TextStyle(
      fontFamily: "sans", fontWeight: FontWeight.w600, color: Colors.red);
  static TextStyle redirectingText = const TextStyle(
      fontFamily: "sans", fontWeight: FontWeight.w600, color: Colors.green);
  static TextStyle expansionTileText = const TextStyle(
      fontFamily: "sans",
      fontSize: 11,
      fontWeight: FontWeight.w700,
      color: Colors.black);
  static TextStyle expansionTileSubText = const TextStyle(
      fontFamily: "sans",
      fontSize: 9.5,
      fontWeight: FontWeight.w700,
      color: Colors.black);
  static TextStyle expansionTileBackup = const TextStyle(
      fontFamily: "sans",
      fontSize: 9.5,
      fontWeight: FontWeight.w700,
      color: Colors.green);
  static TextStyle companyDetailsHeading = const TextStyle(
      fontFamily: "sans",
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: Colors.white);
  static TextStyle modalSheetHeading = const TextStyle(
      fontFamily: "sans",
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.white);
  static TextStyle updatingTitle = const TextStyle(
      fontFamily: "sans",
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: Colors.black);
}
