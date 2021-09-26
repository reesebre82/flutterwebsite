import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/containers/PhoneAnimation/PhoneAnimation.dart';
import 'package:website/controllers/PageViewController.dart';

import '../Header.dart';
import '../../Responsive.dart';

class HomeContainer extends StatefulWidget {
  HomeContainer({Key? key}) : super(key: key);
  @override
  HomeContainerState createState() => HomeContainerState();
}

class HomeContainerState extends State<HomeContainer> {
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

    double textOffset = 0;
    double pageWidth = MediaQuery.of(context).size.width;

    if (pageWidth > 1400) {
      textOffset = 0;
    } else if (pageWidth <= 1400 && pageWidth > 1300) {
      textOffset = 50;
    } else if (pageWidth <= 1300 && pageWidth > 1215) {
      textOffset = 100;
    } else if (pageWidth <= 1215 && pageWidth > 1135) {
      textOffset = 150;
    } else if (pageWidth <= 1135) {
      textOffset = 200;
    }

    if (Responsive.isDesktop(context)) {
      return SliverStickyHeader(
        header: Container(
          color: Colors.grey,
        ),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: screenHeight * 1.25,
                child: Stack(
                  children: [
                    Positioned(
                      right:
                          MediaQuery.of(context).size.width * 0.2 - textOffset,
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
                                "A Full Stack developer ready to make an impact with one line at a time.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorPalette.darkJungleGreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
              ),
            ],
          ),
        ),
      );
    }
    return SliverStickyHeader(
      header: Container(
        height: 0,
        // color: Colors.grey,
        // child: Header(
        //     title: "Brendan Reese, Software Development", showMenu: true),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              height: MediaQuery.of(context).size.height,
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
                        "A Full Stack developer ready to make an impact with one line at a time.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorPalette.darkJungleGreen,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
