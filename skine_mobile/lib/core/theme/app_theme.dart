import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Midnight Clinical Palette
  static const Color background = Color(0xFF0F0D0C);
  static const Color surface = Color(0xFF1A1716);
  static const Color primary = Color(0xFF4A3C31);
  static const Color accent = Color(0xFF8C7A6E);
  static const Color accentLight = Color(0xFFC2B29F);
  
  static const Color textMain = Color(0xFFF5F5F4); // stone-100
  static const Color textDim = Color(0xFFA8A29E);  // stone-400
  static const Color textMuted = Color(0xFF78716C); // stone-500

  static const Color border = Color(0xFF292524); // stone-800
  static const Color glassBorder = Color(0x1FFFFFFF); // white with 12% opacity
  
  static const Color emerald = Color(0xFF34D399); // emerald-400
  static const Color amber = Color(0xFFFBBF24);   // amber-400
  static const Color indigo = Color(0xFF818CF8);  // indigo-400
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
        background: AppColors.background,
        onPrimary: Colors.white,
        onSurface: AppColors.textMain,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textMain,
          letterSpacing: -0.5,
        ),
        headlineMedium: GoogleFonts.playfairDisplay(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.textMain,
        ),
        titleLarge: GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.textMain,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textMain,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textDim,
          height: 1.5,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: AppColors.textMuted,
          letterSpacing: 1.2,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }
}
