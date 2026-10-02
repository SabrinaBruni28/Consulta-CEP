import 'package:flutter/material.dart';

class AppTheme {
  // Cores primárias
  static const Color primaryColor = Color(0xFF6366F1);
  static const Color secondaryColor = Color(0xFF8B5CF6);

  // Cores padrão
  static const Color accentColor = Color(0xFF06B6D4);
  static const Color surfaceColor = Color(0xFFF8FAFC);
  static const Color backgroundColor = Color(0xFFFFFBFF);

  // Cores de status
  static const Color errorColor = Color(0xFFEF4444);
  static const Color successColor = Color(0xFF10B981);
  static const Color warningColor = Color(0xFFF59E0B);

  // Construtor
  AppTheme._();

  // Tema Claro
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,

      // Cores
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor,
        surface: surfaceColor,
        error: errorColor,
      ),

      // App Bar
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),

        iconTheme: IconThemeData(color: Colors.white),
      ),

      // Texto
      textTheme: TextTheme(
        // Headlines
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1E293B),
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1E293B),
        ),

        // Titles
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1E293B),
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1E293B),
        ),

        // Bodys
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Color(0xFF475569),
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Color(0xFF64748B),
        ),
      ),

      // Input
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,

        // Bordas
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: primaryColor.withValues(alpha: 0.3),
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: primaryColor.withValues(alpha: 0.3),
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: errorColor,
          ),
        ),

        // Style
        labelStyle: TextStyle(
          color: primaryColor.withValues(alpha: 0.8),
        ),

        hintStyle: TextStyle(color: Colors.grey.shade500),
      ),

      // Botões
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 3,

          padding: EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 24,
          ),

          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shadowColor: primaryColor.withValues(alpha: 0.3),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12),
          ),

          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Tema Escuro
  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor,
        surface: const Color(0xFF1E293B),
        error: errorColor,
      ),

      scaffoldBackgroundColor: Color(0xFF0F172A),

      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),

        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
