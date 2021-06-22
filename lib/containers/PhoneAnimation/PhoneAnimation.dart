import 'package:flutter/material.dart';
import 'package:website/ColorPallette.dart';

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
        Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Positioned(
                top: widget.height * 0.1,
                left: widget.width * 0.04,
                child: Container(
                  width: widget.width * 0.925,
                  height: widget.height * 0.78,
                  color: ColorPallette.ceruleanBlue,
                ),
              ),
              Image(
                height: widget.height,
                width: widget.width,
                image: AssetImage(
                    'images/icons/PhoneAnimationIcons/phoneicon.png'),
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
        Positioned(
          top: getYOffset(0),
          left: getXOffset(0),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            iconData: Icons.person,
            newScreen: 1,
            title: "About",
            color: ColorPallette.getTheme(0),
          ),
        ),
        Positioned(
          top: getYOffset(0),
          left: getXOffset(1),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            iconData: Icons.account_tree,
            newScreen: 2,
            title: "Projects",
            color: ColorPallette.getTheme(2),
          ),
        ),
        Positioned(
          top: getYOffset(0),
          left: getXOffset(2),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            iconData: Icons.school,
            newScreen: 4,
            title: "Education",
            color: ColorPallette.getTheme(1),
          ),
        ),
        Positioned(
          top: getYOffset(0),
          left: getXOffset(3),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            iconData: Icons.contact_mail,
            newScreen: 5,
            title: "Contact",
            color: ColorPallette.getTheme(3),
          ),
        ),
        //SECOND ROW
        Positioned(
          top: getYOffset(1),
          left: getXOffset(0),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            iconData: Icons.description,
            newScreen: 6,
            title: "Resume",
            color: ColorPallette.getTheme(2),
          ),
        ),
        Positioned(
          top: getYOffset(1),
          left: getXOffset(1),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            color: ColorPallette.getTheme(3),
          ),
        ),
        Positioned(
          top: getYOffset(1),
          left: getXOffset(2),
          child: PhoneIcon(
            icon: 1,
            height: widget.height,
            color: ColorPallette.getTheme(0),
          ),
        ),
        Positioned(
          top: getYOffset(1),
          left: getXOffset(3),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            color: ColorPallette.getTheme(1),
          ),
        ),
        //Third row
        Positioned(
          top: getYOffset(2),
          left: getXOffset(0),
          child: PhoneIcon(
            icon: 4,
            height: widget.height,
            newScreen: 3,
            color: ColorPallette.getTheme(2),
          ),
        ),
        // Positioned(
        //   top: getYOffset(2),
        //   left: getXOffset(2),
        //   child: PhoneIcon(icon: 1, height: widget.height),
        // ),
        // Positioned(
        //   top: getYOffset(2),
        //   left: getXOffset(3),
        //   child: PhoneIcon(icon: 0, height: widget.height),
        // ),
        // Positioned(
        //   top: getYOffset(3),
        //   left: getXOffset(2),
        //   child: PhoneIcon(icon: 0, height: widget.height),
        // ),
        // Positioned(
        //   top: getYOffset(3),
        //   left: getXOffset(3),
        //   child: PhoneIcon(icon: 1, height: widget.height),
        // ),
        // // //Forth Row
        // Positioned(
        //   top: getYOffset(4.1),
        //   left: getXOffset(2.1),
        //   child: PhoneIcon(icon: 3, height: widget.height),
        // ),
        // Positioned(
        //   top: getYOffset(4),
        //   left: getXOffset(0),
        //   child: PhoneIcon(icon: 1, height: widget.height),
        // ),
        // Positioned(
        //   top: getYOffset(4),
        //   left: getXOffset(1),
        //   child: PhoneIcon(icon: 0, height: widget.height),
        // ),
        // Positioned(
        //   top: getYOffset(5),
        //   left: getXOffset(0),
        //   child: PhoneIcon(icon: 1, height: widget.height),
        // ),
        // Positioned(
        //   top: getYOffset(5),
        //   left: getXOffset(1),
        //   child: PhoneIcon(icon: 0, height: widget.height),
        // ),
      ],
    );
  }
}
