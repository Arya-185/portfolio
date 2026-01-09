// lib/theme/theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors
  static const primaryColor = Color(0xFF2563EB);
  static const primaryDark = Color(0xFF60A5FA);
  static const secondaryColor = Color(0xFF64748B);

  // Light Mode Palette
  static const lightBackground = Color(0xFFFAFAFA);
  static const lightSurface = Colors.white;
  static const lightOutline = Color(0xFFE2E8F0); // Grey.200
  static const lightText = Color(0xFF0F172A);

  // Dark Mode Palette
  static const darkBackground = Color(0xFF0F172A);
  static const darkSurface = Color(0xFF1E293B);
  static const darkOutline = Color(0xFF334155);
  static const darkText = Color(0xFFF8FAFC);

  static ThemeData lightTheme(Color primaryColor) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackground,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        primaryContainer: const Color(0xFFEFF6FF),
        // Very light blue for Hero badge
        onPrimary: Colors.white,
        surface: lightSurface,
        onSurface: lightText,
        secondary: secondaryColor,
        outline: lightOutline,
        outlineVariant: const Color(0xFFCBD5E1), // Grey.300 for chips
      ),
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: lightText,
        displayColor: lightText,
      ),
      // Cards (Projects)
      cardTheme: CardThemeData(
        color: lightSurface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: lightOutline),
        ),
      ),
      // Chips (Skills)
      chipTheme: ChipThemeData(
        backgroundColor: lightSurface,
        side: const BorderSide(color: Color(0xFFCBD5E1)),
        // Grey.300
        labelStyle: TextStyle(color: lightText),
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      // Inputs (Login)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightSurface,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: lightOutline),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
      ),
      dividerColor: lightOutline,
    );
  }

  static ThemeData darkTheme(Color primaryColor) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: primaryDark,
        primaryContainer: Color(0xFF172554),
        // Dark blue container
        onPrimary: darkBackground,
        surface: darkSurface,
        onSurface: darkText,
        secondary: Color(0xFF94A3B8),
        outline: darkOutline,
        outlineVariant: Color(0xFF475569),
      ),
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: darkText,
        displayColor: darkText,
      ),
      cardTheme: CardThemeData(
        color: darkSurface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: darkOutline),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: darkSurface,
        side: const BorderSide(color: darkOutline),
        labelStyle: TextStyle(color: darkText),
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryDark,
          foregroundColor: darkBackground,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: darkSurface,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: darkOutline),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryDark, width: 2),
        ),
      ),
      dividerColor: darkOutline,
    );
  }
}
