import 'package:digital_store/widgets/theme/schema.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData themeData(BuildContext context) {
    return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
        primary: kPrimaryColor,
      ),
      textTheme: GoogleFonts.lexendTextTheme(
        Theme.of(context).textTheme,
      ),
      backgroundColor: kBackgroundColor,
    );
  }
}
