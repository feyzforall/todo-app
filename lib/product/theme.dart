import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    // 22px : ("Yapılacaklar", "Tamamlanan" gibi başlıklarda kullanılıyor)
    titleLarge: TextStyle(
      fontFamily: GoogleFonts.bebasNeue().fontFamily,
    ),
    // 12px : TodoCard adlı widgetta title bu fontu kullanıyor.
    // TODO: Tasarımda başka bir font family var ama kütüphanede
    // o font yok. Konuşulacak.
    labelMedium: TextStyle(
      fontFamily: GoogleFonts.roboto().fontFamily,
    ),
    labelSmall: TextStyle(
      fontFamily: GoogleFonts.roboto().fontFamily,
    ),
  ),
);
