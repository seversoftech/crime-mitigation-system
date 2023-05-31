import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle =
    const TextStyle(fontWeight: FontWeight.w400, fontSize: 16);
TextStyle textStyleBig =
    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25);

ThemeData themeData() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        shadowColor: Colors.deepPurple,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.deepPurple)),
    textTheme: GoogleFonts.latoTextTheme(),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );
}
