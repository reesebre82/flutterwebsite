import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:website/ColorPallette.dart';
import 'package:website/containers/Education/EducationBoxAnimation.dart';
import 'package:website/containers/Education/EducationTimelineBuilder.dart';
import 'package:provider/provider.dart';
import 'package:website/controllers/EducationAnimationController.dart';

import '../Header.dart';

class EducationContainer extends StatefulWidget {
  EducationContainer({Key? key}) : super(key: key);
  @override
  EducationContainerState createState() => EducationContainerState();
}

class EducationContainerState extends State<EducationContainer> {
  @override
  Widget build(BuildContext context) {
    var educationController =
        Provider.of<EducationAnimationController>(context);
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
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ColorPallette.seaGreen, ColorPallette.getTheme(0)],
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: Text(
                        "Education Experience",
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
              color: ColorPallette.getTheme(0),
              constraints: BoxConstraints(minHeight: 800),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (educationController.animated[0])
                      EducationBoxAnimation(
                        centerOffset: 250,
                        fromLeft: true,
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
                          centerOffset: 250,
                          fromLeft: false,
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
                          centerOffset: 250,
                          fromLeft: true,
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
                          centerOffset: 250,
                          fromLeft: false,
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
          ],
        ),
      ),
    );
  }
}
