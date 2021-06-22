import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPallette.dart';

import 'package:website/controllers/PageViewController.dart';

class AboutBoxAnimation extends StatefulWidget {
  bool fromLeft;
  double centerOffset;
  double width;
  double height;
  bool animated = false;
  //Text Later on
  String title;
  String text;

  AboutBoxAnimation({
    required this.fromLeft,
    required this.centerOffset,
    required this.width,
    required this.height,
    required this.title,
    required this.text,
  });

  @override
  AboutBoxAnimationState createState() => AboutBoxAnimationState();
}

class AboutBoxAnimationState extends State<AboutBoxAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _opacityController;
  late Animation animation;
  late Animation opacityAnimation;

  late double scrollOffset;
  late double screenHeight;
  late double screenWidth;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: Duration(milliseconds: 500), vsync: this)
      ..addListener(() => setState(() {}));
    _opacityController = new AnimationController(
        duration: Duration(milliseconds: 500), vsync: this)
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _opacityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    scrollOffset = context.read<PageViewController>().scrollPosition;
    double startLocation = 0.0;
    double endLocation = 0.0;

    if (widget.fromLeft) {
      endLocation =
          (screenWidth / 2) - widget.centerOffset - (widget.width / 2);
      startLocation = endLocation - 250;
    } else {
      endLocation =
          (screenWidth / 2) + widget.centerOffset - (widget.width / 2);
      startLocation = endLocation + 250;
    }

    animation = Tween(begin: startLocation, end: endLocation)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _opacityController, curve: Curves.easeOut));
    _opacityController.forward();

    return Transform.translate(
      offset: Offset(animation.value, 0),
      child: Opacity(
        opacity: opacityAnimation.value,
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: ColorPallette.yellow,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}
