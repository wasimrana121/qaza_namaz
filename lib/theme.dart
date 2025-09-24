import 'package:flutter/material.dart';

class AppThemes {
  // 🌿 Oasis Theme
  static final oasisTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF2E7D32), // Emerald Green
    scaffoldBackgroundColor: const Color(0xFFF1F8E9), // Mint Cream
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFF2E7D32),
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFF212121), fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF2962FF), // Royal Blue
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
  );

  // 🌌 Galaxy Night Theme
  static final galaxyNightTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF3F51B5), // Indigo
    scaffoldBackgroundColor: const Color(0xFF0D1B2A), // Deep Space Blue
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFF3F51B5),
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    cardTheme: CardThemeData(
      color: Color(0xFF1B263B),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white70, fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFFC107), // Amber
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
  );

  // 🌺 Spiritual Blossom Theme
  static final blossomTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFFE91E63), // Rose Pink
    scaffoldBackgroundColor: const Color(0xFFF3E5F5), // Soft Lavender
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFFE91E63),
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFF212121), fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFF7043), // Sunset Orange
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
  );
}
