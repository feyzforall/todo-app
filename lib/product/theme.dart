import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  cardColor: AppColors.cultured,
  fontFamily: GoogleFonts.openSans().fontFamily,
  disabledColor: AppColors.lightSilver,
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
    labelLarge: TextStyle(
      fontFamily: GoogleFonts.openSans().fontFamily,
      fontWeight: FontWeight.w300,
    ),
    labelSmall: TextStyle(
      fontFamily: GoogleFonts.openSans().fontFamily,
      fontWeight: FontWeight.w300,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black54,
  dividerColor: AppColors.lightSilver,
  iconTheme: const IconThemeData(
    color: AppColors.lightSilver,
  ),
  cardColor: AppColors.oldSilver.withOpacity(0.5),
  disabledColor: AppColors.chineseBlack,
  fontFamily: GoogleFonts.openSans().fontFamily,
  textTheme: TextTheme(
    // 22px : ("Yapılacaklar", "Tamamlanan" gibi başlıklarda kullanılıyor)
    titleLarge: TextStyle(
      fontFamily: GoogleFonts.bebasNeue().fontFamily,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.05,
      color: AppColors.lightSilver,
    ),
    titleMedium: const TextStyle(
      color: AppColors.lightSilver,
    ),
    // 12px : TodoCard adlı widgetta title bu fontu kullanıyor.
    // TODO: Tasarımda başka bir font family var ama kütüphanede
    // o font yok. Konuşulacak.
    labelLarge: TextStyle(
      fontFamily: GoogleFonts.openSans().fontFamily,
      fontWeight: FontWeight.w300,
    ),
    labelSmall: TextStyle(
      fontFamily: GoogleFonts.openSans().fontFamily,
      fontWeight: FontWeight.w300,
    ),
    headlineSmall: const TextStyle(
      color: AppColors.lightSilver,
    ),
  ),
);
