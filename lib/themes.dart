import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 🎨 Warna neon
const Color neonBlueDark = Color(0xFF005CFF); // biru gelap neon elegan
const Color neonGreen = Color(0xFF39FF14);    // hijau neon cerah

final ColorScheme lightColors = ColorScheme.fromSeed(
  seedColor: neonBlueDark,
  brightness: Brightness.light,
);

final ColorScheme darkColors = ColorScheme.fromSeed(
  seedColor: neonGreen,
  brightness: Brightness.dark,
);

// 🔥 TextStyle dasar dengan efek glow
TextStyle neonText(Color color) => GoogleFonts.pressStart2p(
  color: color,
  shadows: [
    Shadow(
      color: color.withOpacity(0.8),
      blurRadius: 10,
      offset: const Offset(0, 0),
    ),
    Shadow(
      color: color.withOpacity(0.6),
      blurRadius: 20,
      offset: const Offset(0, 0),
    ),
  ],
);

// 🌞 LIGHT THEME (putih transparan + teks biru gelap neon)
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: lightColors,
  scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white.withOpacity(0.7),
    elevation: 2,
    titleTextStyle: neonText(neonBlueDark).copyWith(fontSize: 14),
    iconTheme: const IconThemeData(color: neonBlueDark),
  ),
  textTheme: TextTheme(
    headlineSmall: neonText(neonBlueDark).copyWith(fontSize: 20),
    headlineMedium: neonText(neonBlueDark).copyWith(fontSize: 24),
    titleLarge: neonText(neonBlueDark).copyWith(fontSize: 16),
    titleMedium: neonText(neonBlueDark).copyWith(fontSize: 14),
    bodyLarge: neonText(neonBlueDark).copyWith(fontSize: 12),
    bodySmall: neonText(neonBlueDark).copyWith(fontSize: 10),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white.withOpacity(0.8),
      foregroundColor: neonBlueDark,
      shadowColor: neonBlueDark.withOpacity(0.5),
      elevation: 8,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: neonBlueDark, width: 2),
      ),
      textStyle: neonText(neonBlueDark).copyWith(fontSize: 10),
    ),
  ),
  cardColor: Colors.white.withOpacity(0.75),
  iconTheme: const IconThemeData(color: neonBlueDark),
);

// 🌙 DARK THEME (hitam transparan + teks hijau neon glow)
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: darkColors,
  scaffoldBackgroundColor: Colors.black.withOpacity(0.85),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black.withOpacity(0.7),
    elevation: 2,
    titleTextStyle: neonText(neonGreen).copyWith(fontSize: 14),
    iconTheme: const IconThemeData(color: neonGreen),
  ),
  textTheme: TextTheme(
    headlineSmall: neonText(neonGreen).copyWith(fontSize: 20),
    headlineMedium: neonText(neonGreen).copyWith(fontSize: 24),
    titleLarge: neonText(neonGreen).copyWith(fontSize: 16),
    titleMedium: neonText(neonGreen).copyWith(fontSize: 14),
    bodyLarge: neonText(neonGreen).copyWith(fontSize: 12),
    bodySmall: neonText(neonGreen).copyWith(fontSize: 10),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black.withOpacity(0.7),
      foregroundColor: neonGreen,
      shadowColor: neonGreen.withOpacity(0.6),
      elevation: 8,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: neonGreen, width: 2),
      ),
      textStyle: neonText(neonGreen).copyWith(fontSize: 10),
    ),
  ),
  cardColor: Colors.black.withOpacity(0.75),
  iconTheme: const IconThemeData(color: neonGreen),
);
