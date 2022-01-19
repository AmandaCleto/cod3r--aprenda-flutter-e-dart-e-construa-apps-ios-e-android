import 'package:flutter/material.dart';

class Palette {
  static const Map<int, Color> _darkGray = {
    50: Color.fromRGBO(55, 63, 81, .1),
    100: Color.fromRGBO(55, 63, 81, .2),
    200: Color.fromRGBO(55, 63, 81, .3),
    300: Color.fromRGBO(55, 63, 81, .4),
    400: Color.fromRGBO(55, 63, 81, .5),
    500: Color.fromRGBO(55, 63, 81, .6),
    600: Color.fromRGBO(55, 63, 81, .7),
    700: Color.fromRGBO(55, 63, 81, .8),
    800: Color.fromRGBO(55, 63, 81, .9),
    900: Color.fromRGBO(55, 63, 81, 1),
  };
  static const Map<int, Color> _lightGray = {
    50: Color.fromRGBO(236, 237, 241, .1),
    100: Color.fromRGBO(236, 237, 241, .2),
    200: Color.fromRGBO(236, 237, 241, .3),
    300: Color.fromRGBO(236, 237, 241, .4),
    400: Color.fromRGBO(236, 237, 241, .5),
    500: Color.fromRGBO(236, 237, 241, .6),
    600: Color.fromRGBO(236, 237, 241, .7),
    700: Color.fromRGBO(236, 237, 241, .8),
    800: Color.fromRGBO(236, 237, 241, .9),
    900: Color.fromRGBO(236, 237, 241, 1),
  };
  static const Map<int, Color> _green = {
    50: Color.fromRGBO(88, 167, 176, .1),
    100: Color.fromRGBO(88, 167, 176, .2),
    200: Color.fromRGBO(88, 167, 176, .3),
    300: Color.fromRGBO(88, 167, 176, .4),
    400: Color.fromRGBO(88, 167, 176, .5),
    500: Color.fromRGBO(88, 167, 176, .6),
    600: Color.fromRGBO(88, 167, 176, .7),
    700: Color.fromRGBO(88, 167, 176, .8),
    800: Color.fromRGBO(88, 167, 176, .9),
    900: Color.fromRGBO(88, 167, 176, 1),
  };
  static const Map<int, Color> _gray = {
    50: Color.fromRGBO(169, 188, 208, .1),
    100: Color.fromRGBO(169, 188, 208, .2),
    200: Color.fromRGBO(169, 188, 208, .3),
    300: Color.fromRGBO(169, 188, 208, .4),
    400: Color.fromRGBO(169, 188, 208, .5),
    500: Color.fromRGBO(169, 188, 208, .6),
    600: Color.fromRGBO(169, 188, 208, .7),
    700: Color.fromRGBO(169, 188, 208, .8),
    800: Color.fromRGBO(169, 188, 208, .9),
    900: Color.fromRGBO(169, 188, 208, 1),
  };

  static const MaterialColor customDarkBlueColor = MaterialColor(
    0xFF373F51,
    Palette._darkGray,
  );

  static const MaterialColor customLightColor = MaterialColor(
    0xFFECEDF1,
    Palette._lightGray,
  );

  static const MaterialColor customLightGreenColor = MaterialColor(
    0xFF58A4B0,
    Palette._green,
  );

  static const MaterialColor customGrayColor = MaterialColor(
    0xFFA9BCD0,
    Palette._gray,
  );

  static const beanColors = [
    Color(0xFFEF9CA4),
    Color(0xFF373F51),
    Color(0xFFEEB868),
    Color(0xFF657776),
  ];
}
