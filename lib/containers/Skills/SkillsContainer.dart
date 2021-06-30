import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/containers/Skills/DoubleLinearSkillBar.dart';
import 'package:website/containers/Skills/LinearSkillBar.dart';
import 'package:website/containers/Skills/SkillsCard.dart';
import 'package:website/controllers/PageViewController.dart';
import '../Header.dart';

class SkillsContainer extends StatefulWidget {
  SkillsContainer({Key? key}) : super(key: key);
  @override
  SkillsContainerState createState() => SkillsContainerState();
}

class SkillsContainerState extends State<SkillsContainer> {
  double getHeight() {
    return MediaQuery.of(context).size.height * 1.5;
  }

  double getHeader() {
    return MediaQuery.of(context).size.height * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    var pageViewController = Provider.of<PageViewController>(context);

    double offset =
        pageViewController.getMovingOffset(3, getHeader(), getHeight());

    return SliverStickyHeader(
      header: Container(
        height: 0,
        // color: Colors.grey,
        // child: Header(title: "Skills", showMenu: false),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              height: MediaQuery.of(context).size.height * 1.5,
              color: ColorPalette.mediumTurquise,
              child: Stack(
                children: [
                  Transform.translate(
                    offset: Offset(0, offset),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Center(
                        child: Text(
                          "Skills",
                          style: TextStyle(
                            fontSize: 350,
                            color: ColorPalette.lightMediumTurquise,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 360,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SkillsCard(
                                      title: "Mobile Development",
                                      icons: [
                                        "images/icons/swift.png",
                                        "images/icons/flutter.png",
                                        "images/icons/firebase.png",
                                      ],
                                      skill: [
                                        "Swift",
                                        "Flutter",
                                        "Firebase",
                                      ]),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 50, bottom: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Spacer(flex: 1),
                                  // Expanded(
                                  //   flex: 5,
                                  // child:
                                  SkillsCard(
                                      title: "Language Proficiencies",
                                      icons: [
                                        "images/icons/c++.png",
                                        "images/icons/java.png",
                                        "images/icons/html.png",
                                        "images/icons/css.png",
                                        "images/icons/js.png",
                                      ],
                                      skill: [
                                        "C++",
                                        "Java",
                                        "HTML",
                                        "CSS",
                                        "JavaScript"
                                      ]),
                                  // ),
                                  // Spacer(flex: 1),
                                ],
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
