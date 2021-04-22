import 'package:flutter/material.dart';


class AppTheme {
  AppTheme._();

  static const Color lightBackground = Color(0xFF61FAFF);
  static const Color darkBackground = Color(0xFF006AA3);

  static const Color appColor = Color(0xFFBC544B);

  static TextStyle headerStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle headerSubtitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle titleStyle = TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.bold,
      color: Colors.redAccent,
      shadows: titleShadow
  );

  static List<Shadow> titleShadow = [
    Shadow(
      offset: Offset(4.0, 3.0),
      blurRadius: 3.0,
      color: Colors.black,
    ),
    Shadow(
      offset: Offset(4.0, 3.0),
      blurRadius: 5.0,
      color: Colors.black,
    ),
  ];

  static List<Shadow> shadow = [
    Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 1.0,
      color: Colors.black,
    ),
    Shadow(
      offset: Offset(2.0, 1.0),
      blurRadius: 1.0,
      color: Colors.black,
    ),
  ];

  static TextStyle subtitleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.redAccent,
      shadows: titleShadow
  );

  static TextStyle linkStyle = TextStyle(
      color: Colors.redAccent,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      fontSize: 13,
      shadows: shadow);

  static TextStyle textStyle = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: shadow);

  static TextStyle button = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'Montserrat',
      fontSize: 20
  );

  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.red,
      accentColor: Colors.greenAccent,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      canvasColor: Colors.transparent
  );


  static final darkTheme =
  ThemeData(brightness: Brightness.dark, primarySwatch: Colors.red);

// static final TextTheme lightTextTheme = TextTheme(headline1: lightHeadline1, body1: lightBody1 );
}