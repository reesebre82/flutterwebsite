import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';

import 'package:website/containers/Project/FullProject.dart';
import 'package:website/containers/Project/ProjectData.dart';

import 'package:website/containers/Project/ProjectIcon.dart';
import 'package:website/containers/Project/HeroDialogRoute.dart';
import 'package:website/controllers/PageViewController.dart';

import '../Header.dart';

class ProjectContainer extends StatefulWidget {
  ProjectContainer({Key? key}) : super(key: key);
  @override
  ProjectContainerState createState() => ProjectContainerState();
}

class ProjectContainerState extends State<ProjectContainer> {
  double getHeight() {
    return MediaQuery.of(context).size.height * 1.25;
  }

  double getHeader() {
    return MediaQuery.of(context).size.height * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    var pageViewController = Provider.of<PageViewController>(context);
    double offset =
        pageViewController.getMovingOffset(2, getHeader(), getHeight());

    return SliverStickyHeader(
      header: Container(
        height: 0,
        // color: Colors.grey,
        // child: Header(title: "Projects", showMenu: false),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              height: MediaQuery.of(context).size.height * 1.25,
              color: ColorPalette.white,
              child: Stack(
                children: [
                  Transform.translate(
                    offset: Offset(0, offset),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Center(
                        child: Text(
                          "Projects",
                          style: TextStyle(
                            fontSize: 350,
                            color: ColorPalette.lightGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 425,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.deepOrange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Spacer(),
                              // Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(HeroDialogRoute(
                                    builder: (context) {
                                      return FullProject(
                                        index: 0,
                                        title: ProjectData.titles[0],
                                        text: ProjectData.descriptions[0],
                                        icon: 'reelcaster',
                                        tag: 'reelcaster',
                                        device: Icons.phone_iphone,
                                        images: 4,
                                        videoURL:
                                            'images/reelcaster/reelcastervideo.mov',
                                        githubURL:
                                            'https://github.com/reesebre82/ReelCaster',
                                      );
                                    },
                                    settings: RouteSettings(name: "test"),
                                  ));
                                },
                                child: ProjectIcon(
                                  icon: "reelcaster",
                                  title: ProjectData.titles[0],
                                  description: ProjectData.shortDescriptions[0],
                                  device: Icons.phone_iphone,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(HeroDialogRoute(
                                    builder: (context) {
                                      return FullProject(
                                        index: 0,
                                        text: ProjectData.descriptions[1],
                                        icon: 'sudoku',
                                        tag: 'sudoku',
                                        title: ProjectData.titles[1],
                                        device: Icons.computer,
                                        images: 0,
                                        githubURL:
                                            'https://github.com/reesebre82/SudokuSolver',
                                      );
                                    },
                                    settings: RouteSettings(name: "test"),
                                  ));
                                },
                                child: ProjectIcon(
                                  icon: "sudoku",
                                  title: ProjectData.titles[1],
                                  description: ProjectData.shortDescriptions[1],
                                  device: Icons.computer,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(HeroDialogRoute(
                                    builder: (context) {
                                      return FullProject(
                                        index: 0,
                                        text: "f",
                                        icon: 'tset',
                                        tag: 'test',
                                        title: ProjectData.titles[2],
                                        device: Icons.phone_iphone,
                                        images: 0,
                                      );
                                    },
                                    settings: RouteSettings(name: "test"),
                                  ));
                                },
                                child: ProjectIcon(
                                    icon: "test",
                                    title: ProjectData.titles[2],
                                    description:
                                        ProjectData.shortDescriptions[2],
                                    device: Icons.phone_iphone),
                              ),
                            ],
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
