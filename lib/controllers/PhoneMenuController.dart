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

  double getPhoneMenuOffset() {
    return phoneWidth * 0.1;
  }

  void toggle() {}

  void getOffset() {
    scrollOffsetX = scrollOffset;
    double offset = screenWidth * 0.2 + (phoneWidth * 0.9);
    if (scrollOffsetX > offset) {
      scrollOffsetX = offset;
    }

    notifyListeners();
  }
}
