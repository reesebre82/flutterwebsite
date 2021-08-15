import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/controllers/PageViewController.dart';
import 'dart:html' as html;
import '../Header.dart';

class ResumeContainer extends StatefulWidget {
  ResumeContainer({Key? key}) : super(key: key);
  @override
  ResumeContainerState createState() => ResumeContainerState();
}

class ResumeContainerState extends State<ResumeContainer> {
  double getHeight() {
    return MediaQuery.of(context).size.height * 2.25;
  }

  double getHeader() {
    return MediaQuery.of(context).size.height * 0.5;
  }

  void downloadFile(String url) {
    html.AnchorElement anchorElement = new html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }

  @override
  Widget build(BuildContext context) {
    var pageViewController = Provider.of<PageViewController>(context);

    double titleSize = 350;

    if (MediaQuery.of(context).size.width > 1500) {
      titleSize = 350;
    } else if (MediaQuery.of(context).size.width > 1400) {
      titleSize = 275;
    } else if (MediaQuery.of(context).size.width > 1000) {
      titleSize = 200;
    } else if (MediaQuery.of(context).size.width > 550) {
      titleSize = 115;
    } else {
      titleSize = 75;
    }

    double offset =
        pageViewController.getMovingOffset(6, getHeader(), getHeight());
    return SliverStickyHeader(
      header: Container(
        height: 0,
        // color: Colors.grey,
        // child: Header(title: "Resume", showMenu: false),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              height: MediaQuery.of(context).size.height * 2.25,
              width: MediaQuery.of(context).size.width,
              color: ColorPalette.mediumTurquise,
              child: Stack(
                children: [
                  Transform.translate(
                    offset: Offset(0, offset),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          "Resume",
                          style: TextStyle(
                            fontSize: titleSize,
                            color: ColorPalette.lightMediumTurquise,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 430,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              downloadFile(
                                  'lib/containers/Resume/Resume_Brendan2.pdf');
                            },
                            child: Text(
                              "Download Resume",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 2,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(60.0),
                            child: Image(
                              image: AssetImage('images/Resume_Brendan2.jpg'),
                            ),
                          ),
                        ),
                      ],
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
