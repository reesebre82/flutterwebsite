import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPallette.dart';
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
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    final pageViewController = Provider.of<PageViewController>(context);
    double offset = pageViewController.scrollPosition;

    double scrollTextWidth = 300;

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
                color: ColorPallette.seaGreen,
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
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(fontSize: 70),
                              ),
                            ),
                            Text(
                              "Software Developer",
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(fontSize: 50),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: Text(
                                "A Full Stack developer ready to change the world one line at a time.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.95,
                      left: MediaQuery.of(context).size.width * 0.5 -
                          scrollTextWidth / 2,
                      child: Transform.translate(
                        offset: Offset(offset * 1.9, offset),
                        child: Container(
                          width: scrollTextWidth,
                          child: Center(
                            child: Text(
                              "(Scroll down or use phone for more)",
                              style: GoogleFonts.raleway(
                                textStyle: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
        color: Colors.grey,
        child: Header(
            title: "Brendan Reese, Software Development", showMenu: true),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     color: Colors.grey,
  //     child: Column(
  //       children: [
  //         if (!Responsive.isDesktop(context))
  //           Header(
  //             title: "Brendan Reese",
  //             showMenu: true,
  //           ),
  //         Image(
  //           image: AssetImage('images/chalkboard_web.jpg'),
  //           fit: BoxFit.fill,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
