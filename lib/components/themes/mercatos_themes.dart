import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mercatos/components/themes/mercatos_colors.dart';

abstract class MercatosThemes {
  static ThemeData get data => ThemeData(
        primaryColor: MaterialColor(
          MercatosColors.primary_color.value,
          const <int, Color>{
            50: MercatosColors.primary_color,
            100: MercatosColors.primary_color,
            200: MercatosColors.primary_color,
            300: MercatosColors.primary_color,
            400: MercatosColors.primary_color,
            500: MercatosColors.primary_color,
            600: MercatosColors.primary_color,
            700: MercatosColors.primary_color,
            800: MercatosColors.primary_color,
            900: MercatosColors.primary_color,
          },
        ),
        primarySwatch: MaterialColor(
          MercatosColors.primary_color.value,
          const <int, Color>{
            50: MercatosColors.primary_color,
            100: MercatosColors.primary_color,
            200: MercatosColors.primary_color,
            300: MercatosColors.primary_color,
            400: MercatosColors.primary_color,
            500: MercatosColors.primary_color,
            600: MercatosColors.primary_color,
            700: MercatosColors.primary_color,
            800: MercatosColors.primary_color,
            900: MercatosColors.primary_color,
          },
        ),
        iconTheme: const IconThemeData(color: MercatosColors.primary_color),
        textTheme: GoogleFonts.interTextTheme(),
        backgroundColor: MercatosColors.background_color,
        scaffoldBackgroundColor: MercatosColors.background_color,
      );
}
