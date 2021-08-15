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

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
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

    if (Responsive.isDesktop(context)) {
      return Container(
        height: screenHeight * 1.25,
        color: ColorPalette.mediumTurquise,
        child: Stack(
          children: [
            Positioned(
              right: MediaQuery.of(context).size.width * 0.2,
              top: MediaQuery.of(context).size.height * 0.3,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.height * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Brendan Reese",
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
                        "A full portfolio page is in development. Please stop by soon for the completed project.",
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
                        "In the meantime, you can view some of my public projects at:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorPalette.darkJungleGreen,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
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
                  ],
                ),
              ),
            ),
            if (Responsive.isDesktop(context))
              PhoneContent(
                  key: context.read<PhoneMenuController>().phoneMenuKey,
                  clickable: false),
            // Positioned(
            //   top: MediaQuery.of(context).size.height * 0.95,
            //   left: MediaQuery.of(context).size.width * 0.5 -
            //       scrollTextWidth / 2,
            //   child: Transform.translate(
            //     offset: Offset(offset * 2.5, offset),
            //     child: Container(
            //       width: scrollTextWidth,
            //       child: Center(
            //         child: Text(
            //           "(Scroll down or use phone for more)",
            //           style: TextStyle(fontSize: 16),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // ),
          ],
        ),
      );
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
                "A full portfolio page is in development. Please stop by soon for the completed project.",
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
                "In the meantime, you can view some of my public projects at:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: ColorPalette.darkJungleGreen,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
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
          ],
        ),
      ),
    );
  }
}
