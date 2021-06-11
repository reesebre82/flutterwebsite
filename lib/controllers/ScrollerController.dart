import 'package:flutter/material.dart';

class ScrollerController extends ChangeNotifier {
  var scrollValue = 0.0;
  var screenWidth = 0.0;
  var screenFull = 1680.0;

  void scrollTo(y) {
    scrollValue = y;
    notifyListeners();
  }

  void setWidth(width) {
    screenWidth = width;
  }

  double resume() {
    var screenRatio = screenWidth / screenFull;
    return screenWidth * 2;
  }

  double about() {
    return 50.0;
  }

  double project() {
    return 50.0;
  }

  double skills() {
    return 50.0;
  }

  double education() {
    return 50.0;
  }

  double contact() {
    return 50.0;
  }
}
