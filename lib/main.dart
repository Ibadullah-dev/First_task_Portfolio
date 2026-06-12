import 'package:flutter/material.dart';
// removed google_fonts dependency; using default TextTheme
import 'splash_screen.dart';

void main() {
  runApp(const IbadPortfolioApp());
}

class IbadPortfolioApp extends StatelessWidget {
  const IbadPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ibad Ullah Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0E1A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6C63FF),
          secondary: Color(0xFF03DAC6),
          surface: Color(0xFF12172B),
        ),
        textTheme: ThemeData.dark().textTheme,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}