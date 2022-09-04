// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultRadius = 30.0;
double defaultFontSize = 20.0;
double defaultMargin = 18.0;
double regularFontSize = 15.0;

TextStyle mainTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
);

// ignore: prefer_const_constructors
MaterialColor swatchColor = MaterialColor(
  0xff008CD6,
  // ignore: prefer_const_literals_to_create_immutables
  <int, Color>{
    50: Color(0xff008CD6),
    100: Color(0xff008CD6),
    200: Color(0xff008CD6),
    300: Color(0xff008CD6),
    400: Color(0xff008CD6),
    500: Color(0xff008CD6),
    600: Color(0xff008CD6),
    700: Color(0xff008CD6),
    800: Color(0xff008CD6),
    900: Color(0xff008CD6),
  },
);

Color kBluePrimaryColor = const Color(0xff008CD6);
Color kWhitePrimaryColor = const Color(0xffFFFFFF);
Color kRedAdditionalColor = const Color(0xffF73939);
Color kTransparentColor = Colors.transparent;
Color kCloudyGrayColor = const Color(0xffB7B7B7);
Color kBlackColor = const Color(0xff000000);
Color kMetalGrayColor = Color(0xff707070);
Color kFogGrayColor = Color(0xffF2F2F2);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
