import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFD50000);
  static const Color secondary = Colors.black26;
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(color: primary, elevation: 10),
    inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: black, fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: secondary), borderRadius: BorderRadius.all(Radius.circular(5))),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primary), borderRadius: BorderRadius.all(Radius.circular(5))),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
  );
}
