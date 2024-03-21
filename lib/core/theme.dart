import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: non_constant_identifier_names
ThemeData AppTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: kPrimaryColor,
  textTheme:
      GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme).copyWith(
    headlineLarge: GoogleFonts.eczar(
      textStyle: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.normal,
      ),
    ),
  ),
);
