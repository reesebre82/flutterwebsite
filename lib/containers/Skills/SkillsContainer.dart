import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/ColorPallette.dart';
import 'package:website/containers/Skills/DoubleLinearSkillBar.dart';
import 'package:website/containers/Skills/LinearSkillBar.dart';
import 'package:website/containers/Skills/SkillsCard.dart';
import '../Header.dart';

class SkillsContainer extends StatefulWidget {
  SkillsContainer({Key? key}) : super(key: key);
  @override
  SkillsContainerState createState() => SkillsContainerState();
}

class SkillsContainerState extends State<SkillsContainer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ColorPallette.aquamarine, ColorPallette.seaGreen],
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: Text(
                        "Skills",
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
              color: ColorPallette.seaGreen,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          Spacer(flex: 1),
                          Expanded(
                            flex: 5,
                            child:
                                SkillsCard(title: "Mobile Development", icons: [
                              "images/icons/swift.png",
                              "images/icons/flutter.png",
                              "images/icons/firebase.png",
                            ], skill: [
                              "Swift",
                              "Flutter",
                              "Firebase",
                            ]),
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 50),
                      child: Row(
                        children: [
                          Spacer(flex: 1),
                          Expanded(
                            flex: 5,
                            child: SkillsCard(
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
                          ),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 30),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text("Testing"),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding:
            //       EdgeInsets.symmetric(horizontal: width * 0.125, vertical: 60),
            //   child: DoubleLinearSkillBar(
            //     titles: ["Swift and iOS Development", "C++"],
            //     values: [0.95, 0.9],
            //   ),
            // ),
            // Padding(
            //   padding:
            //       EdgeInsets.symmetric(horizontal: width * 0.125, vertical: 60),
            //   child: DoubleLinearSkillBar(
            //     titles: ["HTML/CSS/JavaScript", "Java"],
            //     values: [0.8, 0.87],
            //   ),
            // ),
            // Padding(
            //   padding:
            //       EdgeInsets.symmetric(horizontal: width * 0.125, vertical: 60),
            //   child: DoubleLinearSkillBar(
            //     titles: ["CI/CD", "Parralell Programming"],
            //     values: [0.75, 0.825],
            //   ),
            // ),
            // Padding(
            //   padding:
            //       EdgeInsets.symmetric(horizontal: width * 0.125, vertical: 60),
            //   child: DoubleLinearSkillBar(
            //     titles: ["Git", "AWS"],
            //     values: [0.875, 0.67],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
