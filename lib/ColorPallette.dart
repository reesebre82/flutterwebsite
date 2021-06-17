import 'dart:math';

import 'package:flutter/material.dart';

class ColorPallette {
  static Color darkGreen = Color(0xff157F1F);
  static Color lightGreen = Color(0xff4CB963);
  static Color teal = Color(0xffA0EADE);
  static Color purple = Color(0xff5C6784);

  static Color yellow = Color(0xffD4DE64);
  static Color aquamarine = Color(0xff7BF4C2);
  static Color seaGreen = Color(0xff29BA7E);
  static Color lightPurple = Color(0xff968EF6);

  static Color charcoalBlue = Color(0xff37515f);
  static Color ceruleanBlue = Color(0xff6d9dc5);

  static Color getRandom() {
    switch (Random().nextInt(4)) {
      case 0:
        return yellow;
      case 1:
        return aquamarine;
      case 2:
        return seaGreen;
      case 3:
        return lightPurple;
      default:
        return Colors.black;
    }
  }

  static Color getTheme(id) {
    switch (id) {
      case 0:
        return yellow;
      case 1:
        return aquamarine;
      case 2:
        return seaGreen;
      case 3:
        return lightPurple;
      default:
        return Colors.black;
    }
  }
}
