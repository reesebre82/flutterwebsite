import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/Content/PhoneContent.dart';
import 'package:website/containers/PhoneAnimation/PhoneAnimation.dart';
import 'package:website/controllers/PageViewController.dart';
import 'package:website/controllers/PhoneMenuController.dart';

import '../Header.dart';
import '../../Responsive.dart';

class ScreenTooSmall extends StatefulWidget {
  ScreenTooSmall({Key? key}) : super(key: key);
  @override
  ScreenTooSmallState createState() => ScreenTooSmallState();
}

class ScreenTooSmallState extends State<ScreenTooSmall> {
  bool _hover = false;
  double getHeight() {
    if (!Responsive.isDesktop(context)) {
      return MediaQuery.of(context).size.height;
    }
    return MediaQuery.of(context).size.height * 1.25;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    final pageViewController = Provider.of<PageViewController>(context);
    double offset = pageViewController.scrollPosition;

    double scrollTextWidth = 300;

    Color color = ColorPalette.darkJungleGreen;

    if (_hover) {
      color = Colors.blueGrey;
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      color: ColorPalette.mediumTurquise,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Brendan Reese",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 65,
                color: ColorPalette.darkJungleGreen,
              ),
            ),
            Text(
              "Software Developer",
              style: TextStyle(
                fontSize: 24,
                color: ColorPalette.darkJungleGreen,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(
                "Screen Resolution is too small for the website to function properly.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: ColorPalette.darkJungleGreen,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(
                "Please use a computer, or you can view my GitHub site at the following:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: ColorPalette.darkJungleGreen,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Material(
                child: InkWell(
                  onTap: () {
                    launch('https://github.com/reesebre82/');
                  },
                  onHover: (value) {
                    setState(() {
                      _hover = value;
                    });
                  },
                  child: Text(
                    "https://github.com/reesebre82/",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
