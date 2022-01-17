import 'package:flutter/material.dart';

class Palette {
  static const Map<int, Color> _darkBlue = {
    50: Color.fromRGBO(52, 73, 102, .1),
    100: Color.fromRGBO(52, 73, 102, .2),
    200: Color.fromRGBO(52, 73, 102, .3),
    300: Color.fromRGBO(52, 73, 102, .4),
    400: Color.fromRGBO(52, 73, 102, .5),
    500: Color.fromRGBO(52, 73, 102, .6),
    600: Color.fromRGBO(52, 73, 102, .7),
    700: Color.fromRGBO(52, 73, 102, .8),
    800: Color.fromRGBO(52, 73, 102, .9),
    900: Color.fromRGBO(52, 73, 102, 1),
  };
  static const Map<int, Color> _light = {
    50: Color.fromRGBO(240, 244, 239, .1),
    100: Color.fromRGBO(240, 244, 239, .2),
    200: Color.fromRGBO(240, 244, 239, .3),
    300: Color.fromRGBO(240, 244, 239, .4),
    400: Color.fromRGBO(240, 244, 239, .5),
    500: Color.fromRGBO(240, 244, 239, .6),
    600: Color.fromRGBO(240, 244, 239, .7),
    700: Color.fromRGBO(240, 244, 239, .8),
    800: Color.fromRGBO(240, 244, 239, .9),
    900: Color.fromRGBO(240, 244, 239, 1),
  };
  static const Map<int, Color> _lightGreen = {
    50: Color.fromRGBO(191, 204, 148, .1),
    100: Color.fromRGBO(191, 204, 148, .2),
    200: Color.fromRGBO(191, 204, 148, .3),
    300: Color.fromRGBO(191, 204, 148, .4),
    400: Color.fromRGBO(191, 204, 148, .5),
    500: Color.fromRGBO(191, 204, 148, .6),
    600: Color.fromRGBO(191, 204, 148, .7),
    700: Color.fromRGBO(191, 204, 148, .8),
    800: Color.fromRGBO(191, 204, 148, .9),
    900: Color.fromRGBO(191, 204, 148, 1),
  };
  static const Map<int, Color> _gray = {
    50: Color.fromRGBO(203, 210, 208, .1),
    100: Color.fromRGBO(203, 210, 208, .2),
    200: Color.fromRGBO(203, 210, 208, .3),
    300: Color.fromRGBO(203, 210, 208, .4),
    400: Color.fromRGBO(203, 210, 208, .5),
    500: Color.fromRGBO(203, 210, 208, .6),
    600: Color.fromRGBO(203, 210, 208, .7),
    700: Color.fromRGBO(203, 210, 208, .8),
    800: Color.fromRGBO(203, 210, 208, .9),
    900: Color.fromRGBO(203, 210, 208, 1),
  };

  static const MaterialColor customDarkBlueColor = MaterialColor(
    0xFF344966,
    Palette._darkBlue,
  );

  static const MaterialColor customLightColor = MaterialColor(
    0xFFF0F4EF,
    Palette._light,
  );

  static const MaterialColor customLightGreenColor = MaterialColor(
    0xFFbfcc94,
    Palette._lightGreen,
  );

  static const MaterialColor customGrayColor = MaterialColor(
    0xFFCBD2D0,
    Palette._gray,
  );
}
