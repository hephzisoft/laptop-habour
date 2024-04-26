import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class AppTheme {
  AppTheme._();

  static var darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.poppins(),
      bodyMedium: GoogleFonts.poppins(),
    ),
  );
}
