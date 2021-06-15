import 'package:flutter/material.dart';

import 'PhoneIcon.dart';

class PhoneAnimation extends StatefulWidget {
  final double height;
  final double width;
  PhoneAnimation({required this.height, required this.width});
  @override
  _PhoneAnimationState createState() => _PhoneAnimationState();
}

class _PhoneAnimationState extends State<PhoneAnimation> {
  double xOffset = 0;
  double yOffset = 0;

  @override
  void initState() {
    super.initState();
  }

  double getXOffset(double index) {
    return ((widget.width / 5) * (index + 1)) - widget.width / 12.5;
  }

  double getYOffset(double index) {
    return (widget.height / 8) * (index + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          height: widget.height,
          width: widget.width,
          image: AssetImage('images/icons/PhoneAnimationIcons/phoneicon.png'),
          fit: BoxFit.fill,
        ),
        Positioned(
          top: getYOffset(0),
          left: getXOffset(0),
          child: PhoneIcon(icon: 0, height: widget.height),
        ),
        Positioned(
          top: getYOffset(0),
          left: getXOffset(1),
          child: PhoneIcon(icon: 1, height: widget.height),
        ),
        Positioned(
          top: getYOffset(0),
          left: getXOffset(2),
          child: PhoneIcon(icon: 0, height: widget.height),
        ),
        Positioned(
          top: getYOffset(0),
          left: getXOffset(3),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            iconData: Icons.description,
            newScreen: 6,
          ),
        ),
        //SECOND ROW
        Positioned(
          top: getYOffset(1),
          left: getXOffset(0),
          child: PhoneIcon(icon: 0, height: widget.height),
        ),
        Positioned(
          top: getYOffset(1),
          left: getXOffset(1),
          child: PhoneIcon(icon: 0, height: widget.height),
        ),
        Positioned(
          top: getYOffset(1),
          left: getXOffset(2),
          child: PhoneIcon(icon: 1, height: widget.height),
        ),
        Positioned(
          top: getYOffset(1),
          left: getXOffset(3),
          child: PhoneIcon(icon: 0, height: widget.height),
        ),
        //Third row
        Positioned(
          top: getYOffset(2),
          left: getXOffset(0),
          child: PhoneIcon(
            icon: 2,
            height: widget.height,
            iconData: Icons.library_books,
            newScreen: 3,
          ),
        ),
        Positioned(
          top: getYOffset(2),
          left: getXOffset(2),
          child: PhoneIcon(icon: 1, height: widget.height),
        ),
        Positioned(
          top: getYOffset(2),
          left: getXOffset(3),
          child: PhoneIcon(icon: 0, height: widget.height),
        ),
        Positioned(
          top: getYOffset(3),
          left: getXOffset(2),
          child: PhoneIcon(icon: 0, height: widget.height),
        ),
        Positioned(
          top: getYOffset(3),
          left: getXOffset(3),
          child: PhoneIcon(icon: 1, height: widget.height),
        ),
        // //Forth Row
        Positioned(
          top: getYOffset(4.1),
          left: getXOffset(2.1),
          child: PhoneIcon(icon: 3, height: widget.height),
        ),
        Positioned(
          top: getYOffset(4),
          left: getXOffset(0),
          child: PhoneIcon(icon: 1, height: widget.height),
        ),
        Positioned(
          top: getYOffset(4),
          left: getXOffset(1),
          child: PhoneIcon(icon: 0, height: widget.height),
        ),
        Positioned(
          top: getYOffset(5),
          left: getXOffset(0),
          child: PhoneIcon(icon: 1, height: widget.height),
        ),
        Positioned(
          top: getYOffset(5),
          left: getXOffset(1),
          child: PhoneIcon(icon: 0, height: widget.height),
        ),
      ],
    );
  }
}