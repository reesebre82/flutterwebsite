import 'package:flutter/material.dart';
import 'package:website/Content.dart';

class PhoneMenuController extends ChangeNotifier {
  final GlobalKey<ContentState> _phoneMenuKey = GlobalKey<ContentState>();

  GlobalKey<ContentState> get phoneMenuKey => _phoneMenuKey;

  double scrollOffset = 0.0;
  double phoneHeight = 0.0;
  double phoneWidth = 0.0;
  double screenWidth = 0.0;

  double scrollOffsetX = 0.0;

  void setPhoneWidth(double width) {
    phoneWidth = width;
  }

  void setPhoneHeight(double height) {
    phoneHeight = height;
  }

  void setScreenWidth(double width) {
    screenWidth = width;
  }

  void updateScrollOffset(double newScrollOffset) {
    scrollOffset = newScrollOffset;
    getOffset();
  }

  double getButtonOpactiy() {
    double offset = screenWidth * 0.2 + (phoneWidth * 0.9);
    return scrollOffsetX / offset;
  }

  double getPhoneMenuOffset() {
    return phoneWidth * 0.1;
  }

  bool toggled = false;
  bool closed = false;
  void toggle() {
    toggled = !toggled;
    if (toggled) {
      // scrollOffsetX = screenWidth * 0.2;
      open();
      notifyListeners();
      print("open");
    } else {
      // scrollOffsetX = screenWidth * 0.2 + (phoneWidth * 0.9);
      getOffset();
      print("closed");
    }
  }

  //TESTING FOR ANIMATING OUTWARD SLIDE

  //END TESTING

  void open() {
    if (scrollOffsetX > 30) {
      scrollOffsetX = scrollOffsetX -= 20;
      notifyListeners();
      Future.delayed(const Duration(microseconds: 1), () {
        open();
      });
    } else {
      scrollOffsetX = 0;
      notifyListeners();
    }
  }

  bool isClosed() {
    return closed;
  }

  void getOffset() {
    if (!toggled) {
      scrollOffsetX = scrollOffset;
      double offset = screenWidth * 0.2 + (phoneWidth * 0.9);
      if (scrollOffsetX > offset) {
        scrollOffsetX = offset;
        closed = true;
      } else {
        closed = false;
      }

      notifyListeners();
    }
  }
}
