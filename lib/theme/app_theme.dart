import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF2B3047); // Dark navy for sidebar
  static const Color backgroundColor = Color(0xFFF2F3F7); // Light grey/purple bg
  static const Color primaryText = Color(0xFF262626);
  static const Color secondaryText = Color(0xFF7E8299);
  
  // Card Backgrounds
  static const Color cardPurple = Color(0xFFD6D9EF);
  static const Color cardCream = Color(0xFFFEF5E5);
  static const Color cardYellow = Color(0xFFFFF7D3);
  static const Color cardBlue = Color(0xFFD9E7FB);
  static const Color white = Colors.white;

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: primaryText,
        displayColor: primaryText,
      ),
      iconTheme: const IconThemeData(color: secondaryText),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primaryColor,
        secondary: const Color(0xFF5B61F5), // Button/Action color
      ),
    );
  }
}
