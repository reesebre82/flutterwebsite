import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/controllers/PageViewController.dart';
import 'package:website/containers/About/AboutBoxAnimation.dart';
import 'package:website/controllers/AboutAnimationController.dart';

class AboutContainer extends StatefulWidget {
  AboutContainer({Key? key}) : super(key: key);
  @override
  AboutContainerState createState() => AboutContainerState();
}

class AboutContainerState extends State<AboutContainer> {
  double getHeight() {
    return MediaQuery.of(context).size.height * 1.5;
  }

  double getHeader() {
    return MediaQuery.of(context).size.height * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    var aboutController = Provider.of<AboutAnimationController>(context);
    var pageViewController = Provider.of<PageViewController>(context);

    double offset =
        pageViewController.getMovingOffset(1, getHeader(), getHeight());

    return SliverStickyHeader(
      header: Container(
        height: 0,
        // child: Header(title: "About Me", showMenu: false),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              height: MediaQuery.of(context).size.height * 1.5,
              color: ColorPalette.blueMunsell,
              child: Stack(
                children: [
                  Transform.translate(
                    offset: Offset(0, offset),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Center(
                        child: Text(
                          "About Me",
                          style: TextStyle(
                            fontSize: 350,
                            color: ColorPalette.lightBlueMunsell,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 360,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
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
