import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF0A0E1A);
  static const Color surface = Color(0xFF12172B);
  static const Color cardBg = Color(0xFF1A2035);
  static const Color primary = Color(0xFF6C63FF);
  static const Color secondary = Color(0xFF03DAC6);
  static const Color accent = Color(0xFFFF6584);
  static const Color gold = Color(0xFFFFD700);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B8D1);
  static const Color glassWhite = Color(0x1AFFFFFF);
  static const Color glassBorder = Color(0x33FFFFFF);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF03DAC6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFF0A0E1A), Color(0xFF12172B), Color(0xFF1A1035)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0x336C63FF), Color(0x1A03DAC6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}