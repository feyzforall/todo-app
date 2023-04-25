import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    // 22px : ("Yapılacaklar", "Tamamlanan" gibi başlıklarda kullanılıyor)
    titleLarge: TextStyle(
      fontFamily: GoogleFonts.bebasNeue().fontFamily,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.05,
    ),
    // 12px : TodoCard adlı widgetta title bu fontu kullanıyor.
    // TODO: Tasarımda başka bir font family var ama kütüphanede
    // o font yok. Konuşulacak.
    labelMedium: TextStyle(
      fontFamily: GoogleFonts.openSans().fontFamily,
      fontWeight: FontWeight.w300,
    ),
    labelSmall: TextStyle(
      fontFamily: GoogleFonts.openSans().fontFamily,
      fontWeight: FontWeight.w300,
    ),
  ),
);
