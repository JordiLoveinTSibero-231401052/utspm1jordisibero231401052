
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ColorScheme lightColors = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
final ColorScheme darkColors = ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColors,
  textTheme: TextTheme(
    headlineSmall: GoogleFonts.pressStart2p(fontSize: 20),
    headlineMedium: GoogleFonts.pressStart2p(fontSize: 24),
    titleLarge: GoogleFonts.pressStart2p(fontSize: 16),
    titleMedium: GoogleFonts.pressStart2p(fontSize: 14),
    bodyLarge: GoogleFonts.pressStart2p(fontSize: 12),
    bodySmall: GoogleFonts.pressStart2p(fontSize: 10),
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColors,
  textTheme: lightTheme.textTheme,
);
