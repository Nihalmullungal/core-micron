import 'package:flutter/material.dart';

class FontTheme {
  static TextStyle heading = const TextStyle(
      fontFamily: "sans",
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static TextStyle hintStyle = TextStyle(
      fontFamily: "sans",
      fontWeight: FontWeight.bold,
      color: Colors.black.withOpacity(0.5));

  static TextStyle loginText = const TextStyle(
      fontFamily: "sans", fontWeight: FontWeight.bold, color: Colors.white);

  static TextStyle signInText = const TextStyle(
      fontFamily: "sans", fontWeight: FontWeight.w600, color: Colors.black);
}
