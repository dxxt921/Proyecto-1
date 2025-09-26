import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Paleta de colores Neón (la mantenemos para ambos temas)
const primaryColor = Color(0xFFF50057); // Rosa Neón
const secondaryColor = Color(0xFF00E5FF); // Cian Neón

// ================= TEMA OSCURO (Neón Nocturno) =================
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    secondary: secondaryColor,
    brightness: Brightness.dark,
    background: const Color(0xFF121019), // Negro Púrpura
    surface: const Color(0xFF1F1C2B),    // Superficie de tarjetas
  ),
  scaffoldBackgroundColor: const Color(0xFF121019),
  textTheme: GoogleFonts.vt323TextTheme(ThemeData.dark().textTheme).copyWith(
    displayMedium: GoogleFonts.pressStart2p(color: Colors.white),
    headlineSmall: GoogleFonts.pressStart2p(color: Colors.white, fontSize: 24),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.pressStart2p(fontSize: 16, color: Colors.white),
  ),
);


// ================= TEMA CLARO (Holográfico) =================
final lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    secondary: secondaryColor,
    brightness: Brightness.light,
    background: const Color(0xFFF0F2F5), // Un gris muy claro
    surface: Colors.white,
  ),
  scaffoldBackgroundColor: const Color(0xFFF0F2F5),
  textTheme: GoogleFonts.vt323TextTheme(ThemeData.light().textTheme).copyWith(
    displayMedium: GoogleFonts.pressStart2p(color: Colors.black),
    headlineSmall: GoogleFonts.pressStart2p(color: Colors.black, fontSize: 24),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.pressStart2p(fontSize: 16, color: Colors.black),
  ),
);