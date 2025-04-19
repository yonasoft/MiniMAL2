import 'package:flutter/material.dart';

// Theme configuration for the app
class AppTheme {
  // Colors
  static const Color _primaryColorLight = Color(0xFF673AB7); // Deep Purple
  static const Color _primaryColorDark = Color(0xFF9C27B0); // Purple

  static const Color _secondaryColorLight = Color(0xFF03A9F4); // Light Blue
  static const Color _secondaryColorDark = Color(0xFF00BCD4); // Cyan

  static const Color _backgroundColorLight = Color(0xFFF5F5F5);
  static const Color _backgroundColorDark = Color(0xFF121212);

  static const Color _surfaceColorLight = Colors.white;
  static const Color _surfaceColorDark = Color(0xFF1E1E1E);

  static const Color _errorColorLight = Color(0xFFB00020);
  static const Color _errorColorDark = Color(0xFFCF6679);

  static const Color _onPrimaryLight = Colors.white;
  static const Color _onPrimaryDark = Colors.white;

  static const Color _onSecondaryLight = Colors.black;
  static const Color _onSecondaryDark = Colors.black;

  static const Color _onBackgroundLight = Colors.black;
  static const Color _onBackgroundDark = Colors.white;

  static const Color _onSurfaceLight = Colors.black;
  static const Color _onSurfaceDark = Colors.white;

  static const Color _onErrorLight = Colors.white;
  static const Color _onErrorDark = Colors.black;

  // Light theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: _primaryColorLight,
        onPrimary: _onPrimaryLight,
        secondary: _secondaryColorLight,
        onSecondary: _onSecondaryLight,
        error: _errorColorLight,
        onError: _onErrorLight,
        background: _backgroundColorLight,
        onBackground: _onBackgroundLight,
        surface: _surfaceColorLight,
        onSurface: _onSurfaceLight,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: _primaryColorLight,
        foregroundColor: _onPrimaryLight,
      ),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: _onPrimaryLight,
          backgroundColor: _primaryColorLight,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryColorLight,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _primaryColorLight, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: _onBackgroundLight,
        ),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: _onBackgroundLight,
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: _onBackgroundLight,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: _onBackgroundLight,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: _onBackgroundLight,
        ),
        titleSmall: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: _onBackgroundLight,
        ),
        bodyLarge: TextStyle(fontSize: 16, color: _onBackgroundLight),
        bodyMedium: TextStyle(fontSize: 14, color: _onBackgroundLight),
        bodySmall: TextStyle(fontSize: 12, color: _onBackgroundLight),
      ),
      dividerTheme: const DividerThemeData(
        space: 1,
        thickness: 1,
        color: Colors.grey,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _surfaceColorLight,
        selectedItemColor: _primaryColorLight,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  // Dark theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: _primaryColorDark,
        onPrimary: _onPrimaryDark,
        secondary: _secondaryColorDark,
        onSecondary: _onSecondaryDark,
        error: _errorColorDark,
        onError: _onErrorDark,
        background: _backgroundColorDark,
        onBackground: _onBackgroundDark,
        surface: _surfaceColorDark,
        onSurface: _onSurfaceDark,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: _surfaceColorDark,
        foregroundColor: _onSurfaceDark,
      ),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        color: _surfaceColorDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: _onPrimaryDark,
          backgroundColor: _primaryColorDark,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryColorDark,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: _primaryColorDark, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        fillColor: _surfaceColorDark,
        filled: true,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: _onBackgroundDark,
        ),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: _onBackgroundDark,
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: _onBackgroundDark,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: _onBackgroundDark,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: _onBackgroundDark,
        ),
        titleSmall: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: _onBackgroundDark,
        ),
        bodyLarge: TextStyle(fontSize: 16, color: _onBackgroundDark),
        bodyMedium: TextStyle(fontSize: 14, color: _onBackgroundDark),
        bodySmall: TextStyle(fontSize: 12, color: _onBackgroundDark),
      ),
      dividerTheme: const DividerThemeData(
        space: 1,
        thickness: 1,
        color: Colors.grey,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _surfaceColorDark,
        selectedItemColor: _primaryColorDark,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
