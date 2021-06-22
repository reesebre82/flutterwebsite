import 'package:flutter/material.dart';

class EducationAnimationController extends ChangeNotifier {
  List<bool> animated = [false, false, false, false, false];
  double _scrollPosition = 0.0;
  double screenHeight = 0.0;

  double get scrollPosition => _scrollPosition;

  bool getAnimated(int index) {
    return animated[index];
  }

  void setScreenHeight(double newHeight) {
    screenHeight = newHeight;
  }

  checkAnimation() {
    if (animated[0] == false) {
      if (scrollPosition >= 3695) {
        animated[0] = true;
        Future.delayed(Duration(milliseconds: 500), () {
          completeAnimation();
        });
      }
    }
  }

  int completeIndex = 1;
  void completeAnimation() {
    animated[completeIndex++] = true;
    notifyListeners();
    if (completeIndex < animated.length - 1) {
      Future.delayed(Duration(milliseconds: 500), () {
        completeAnimation();
      });
    }
  }

  void updateScrollPosition(double newScrollPositon) {
    _scrollPosition = newScrollPositon;

    print(_scrollPosition);
    checkAnimation();
  }
}
