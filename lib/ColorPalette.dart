import 'package:flutter/material.dart';

class ColorPalette {
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

  static Color mindaro = Color(0xFFE0FC8E);
  static Color mediumTurquise = Color(0xFF73D9DD);
  static Color blueMunsell = Color(0xFF3594AB);
  static Color lightSalmon = Color(0xFFFFB18B);
  static Color darkJungleGreen = Color(0xFF042828);

  static Color grey = Color(0xFF507474);
  static Color darkGrey = Color(0xFF3A4F50);
  static Color white = Color(0XFFFFFFFF);

  static Color lightGrey = Color(0XFFF2F2F2);
  static Color lightMediumTurquise = Color(0XFF6DCDD1);
  static Color lightBlueMunsell = Color(0XFF2E859A);

  static Color getTheme(id) {
    switch (id) {
      case 0:
        return mindaro;
      case 1:
        return mediumTurquise;
      case 2:
        return blueMunsell;
      case 3:
        return lightSalmon;
      case 4:
        return darkJungleGreen;
      case 5:
        return grey;
      default:
        return Colors.black;
    }
  }
}

//Mindaro #FFE0FC8E
//MediumTurquoise #FF73D9DD
//BlueMunsell #FF3594AB
//light Salmon #FFFFB18B
//Dark Jungle Green #FF042828

// Background: alternate between tuquise, dark jungle, blue munsell
