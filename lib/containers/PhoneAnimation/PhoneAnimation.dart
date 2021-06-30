import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/controllers/PageViewController.dart';

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
          child: Stack(
            children: [
              Positioned(
                top: widget.height * 0.1,
                left: widget.width * 0.04,
                child: Container(
                  width: widget.width * 0.925,
                  height: widget.height * 0.78,
                  color: ColorPalette.darkGrey,
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
            color: ColorPalette.getTheme(0),
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
            color: ColorPalette.getTheme(3),
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
            color: ColorPalette.getTheme(2),
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
            color: ColorPalette.getTheme(3),
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
            color: ColorPalette.getTheme(2),
          ),
        ),
        Positioned(
          top: getYOffset(1),
          left: getXOffset(1),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            color: ColorPalette.getTheme(1),
          ),
        ),
        Positioned(
          top: getYOffset(1),
          left: getXOffset(2),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            color: ColorPalette.getTheme(0),
          ),
        ),
        Positioned(
          top: getYOffset(1),
          left: getXOffset(3),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            color: ColorPalette.getTheme(1),
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
            color: ColorPalette.getTheme(5),
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

        Positioned(
          bottom: 20,
          child: Container(
            width: widget.width,
            height: widget.height * 0.1,
            child: Center(
              child: InkWell(
                onTap: () {
                  var pageController =
                      Provider.of<PageViewController>(context, listen: false);
                  pageController.setPage(0);
                },
                child: Container(
                  width: widget.width * 0.9,
                  height: widget.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: ColorPalette.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
