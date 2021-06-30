import 'package:flutter/material.dart';
import 'package:website/Content/Content.dart';
import 'package:website/Content/PhoneContent.dart';

class PhoneMenuController extends ChangeNotifier {
  final GlobalKey<PhoneContentState> _phoneMenuKey =
      GlobalKey<PhoneContentState>();

  GlobalKey<PhoneContentState> get phoneMenuKey => _phoneMenuKey;

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
      // print("open");
    } else {
      // scrollOffsetX = screenWidth * 0.2 + (phoneWidth * 0.9);
      close();
      Future.delayed(Duration(milliseconds: 500), () {
        _phoneMenuKey.currentState!.isPhoneOpen = false;
        getOffset();
      });
    }
  }

  void open() {
    _phoneMenuKey.currentState!.openPhone();
  }

  void close() {
    _phoneMenuKey.currentState!.closePhone();
  }

  double getBeginOffset() {
    return screenWidth * 0.2 + (phoneWidth * 0.9);
  }

  double getEndOffset() {
    return 300;
  }

  // void open() {
  //   if (scrollOffsetX > 30) {
  //     scrollOffsetX = scrollOffsetX -= 20;
  //     notifyListeners();
  //     Future.delayed(const Duration(microseconds: 1), () {
  //       open();
  //     });
  //   } else {
  //     scrollOffsetX = 0;
  //     notifyListeners();
  //   }
  // }

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
