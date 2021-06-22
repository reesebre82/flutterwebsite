import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:website/containers/About/AboutBoxAnimation.dart';
import 'package:website/controllers/AboutAnimationController.dart';
import 'package:website/controllers/PageViewController.dart';

import '../../ColorPallette.dart';
import '../Footer.dart';
import '../Header.dart';

class AboutContainer extends StatefulWidget {
  AboutContainer({Key? key}) : super(key: key);
  @override
  AboutContainerState createState() => AboutContainerState();
}

class AboutContainerState extends State<AboutContainer> {
  @override
  Widget build(BuildContext context) {
    var aboutController = Provider.of<AboutAnimationController>(context);
    return SliverStickyHeader(
      header: Container(
        height: 0,
        // child: Header(title: "About Me", showMenu: false),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ColorPallette.seaGreen, ColorPallette.ceruleanBlue],
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: Text(
                        "About Me",
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              color: ColorPallette.ceruleanBlue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (aboutController.animated[0])
                    AboutBoxAnimation(
                      centerOffset: 250,
                      fromLeft: true,
                      width: 400,
                      height: 250,
                      title: "test",
                      text: "test",
                    ),
                  if (aboutController.animated[1])
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: AboutBoxAnimation(
                        centerOffset: 250,
                        fromLeft: false,
                        width: 400,
                        height: 250,
                        title: "test",
                        text: "test",
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
