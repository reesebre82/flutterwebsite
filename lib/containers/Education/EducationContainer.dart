import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/Responsive.dart';
import 'package:website/controllers/PageViewController.dart';
import 'package:website/containers/Education/EducationBoxAnimation.dart';
import 'package:provider/provider.dart';
import 'package:website/controllers/EducationAnimationController.dart';

import '../Header.dart';

class EducationContainer extends StatefulWidget {
  EducationContainer({Key? key}) : super(key: key);
  @override
  EducationContainerState createState() => EducationContainerState();
}

class EducationContainerState extends State<EducationContainer> {
  double getHeight() {
    if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
      return MediaQuery.of(context).size.height * 1.25;
    }
    return MediaQuery.of(context).size.height * 1.5;
  }

  double getHeader() {
    if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
      return MediaQuery.of(context).size.height * 0.25;
    }
    return MediaQuery.of(context).size.height * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    var educationController =
        Provider.of<EducationAnimationController>(context);

    var pageViewController = Provider.of<PageViewController>(context);
    double offset =
        pageViewController.getMovingOffset(4, getHeader(), getHeight());

    double titleSize;
    List<double> centerOffsets = [-300, -150, 150, 300];
    double topOffset = 360;

    if (MediaQuery.of(context).size.width > 1500) {
      topOffset = 360;
      titleSize = 300;
    } else if (MediaQuery.of(context).size.width > 1400) {
      titleSize = 275;
      topOffset = 360;
    } else if (MediaQuery.of(context).size.width > 1000) {
      centerOffsets = [-150, -75, 75, 150];
      topOffset = 300;
      titleSize = 200;
    } else if (MediaQuery.of(context).size.width > 550) {
      titleSize = 110;
      centerOffsets = [0, 0, 0, 0];
      topOffset = 200;
    } else {
      titleSize = 70;
      centerOffsets = [0, 0, 0, 0];
      topOffset = 200;
    }
    return SliverStickyHeader(
      header: Container(
        height: 0,
        // color: Colors.grey,
        // child: Header(title: "Education", showMenu: false),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              height: getHeight(),
              color: ColorPalette.blueMunsell,
              child: Stack(
                children: [
                  Transform.translate(
                    offset: Offset(0, offset),
                    child: Container(
                      height: getHeader(),
                      child: Center(
                        child: Text(
                          "Education",
                          style: TextStyle(
                            fontSize: titleSize,
                            color: ColorPalette.lightBlueMunsell,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: topOffset,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1.1,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (educationController.animated[0])
                              EducationBoxAnimation(
                                centerOffset: centerOffsets[0],
                                width: 400,
                                height: 175,
                                title: "Self Learning",
                                date: "2011",
                                text:
                                    "My early programming education was completely self taught. "
                                    "I taught myself how to develop complete iOS applications"
                                    "and quickly learned new languages and proper data structures.",
                              ),
                            if (educationController.animated[1])
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: EducationBoxAnimation(
                                  centerOffset: centerOffsets[1],
                                  width: 400,
                                  height: 175,
                                  title: "Deployment",
                                  date: "2015",
                                  text:
                                      "I learned how to distribute and deploy applications. "
                                      "During this time, I learned how to efficiently work"
                                      "with companies and consumers of applications. ",
                                ),
                              ),
                            if (educationController.animated[2])
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: EducationBoxAnimation(
                                  centerOffset: centerOffsets[2],
                                  width: 400,
                                  height: 175,
                                  title: "Graduated High School",
                                  date: "2016",
                                  text:
                                      "Throughout high school, I selected every software "
                                      "oriented classes offerred. I learned proper code documentation "
                                      "and clearly code implementation.",
                                ),
                              ),
                            if (educationController.animated[3])
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: EducationBoxAnimation(
                                  centerOffset: centerOffsets[3],
                                  width: 400,
                                  height: 175,
                                  title: "Graduated College",
                                  subTitle:
                                      "Texas State University, BS in Computer Science",
                                  date: "2020",
                                  text:
                                      "College placed a concrete foundation of computer "
                                      "science. I have developed a strong understanding"
                                      " of data structures and algorithms. During this time"
                                      " I learned how to program multiple cores and artifical intelligence.",
                                ),
                              ),
                          ],
                        ),
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
