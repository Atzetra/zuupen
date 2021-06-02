import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData themeData(BuildContext context) {
    return ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(
        Theme.of(context).textTheme,
      ),
    );
  }
}
