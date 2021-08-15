import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/Responsive.dart';

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
    if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
      return MediaQuery.of(context).size.height * 1.00;
    }
    return MediaQuery.of(context).size.height * 1.25;
  }

  double getHeader() {
    if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
      return MediaQuery.of(context).size.height * 0.25;
    }
    return MediaQuery.of(context).size.height * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    double titleSize = 350;
    double contentOffset = 425;

    if (MediaQuery.of(context).size.width > 1400) {
      contentOffset = 425;
    } else if (MediaQuery.of(context).size.width > 1000) {
      contentOffset = 300;
    } else if (MediaQuery.of(context).size.width > 550) {
      contentOffset = 225;
    } else {
      contentOffset = 200;
    }
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

    var pageViewController = Provider.of<PageViewController>(context);
    double offset =
        pageViewController.getMovingOffset(2, getHeader(), getHeight());

    if (MediaQuery.of(context).size.width > 1400)
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
                height: getHeight(),
                color: ColorPalette.white,
                child: Stack(
                  children: [
                    Transform.translate(
                      offset: Offset(0, offset),
                      child: Container(
                        height: getHeader(),
                        child: Center(
                          child: Text(
                            "Projects",
                            style: TextStyle(
                              fontSize: titleSize,
                              color: ColorPalette.lightGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: contentOffset,
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
                                          isGif: false,
                                          isPhone: true,
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
                                    description:
                                        ProjectData.shortDescriptions[0],
                                    device: Icons.phone_iphone,
                                    width: 450,
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
                                          isGif: true,
                                          isPhone: false,
                                          images: 2,
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
                                    description:
                                        ProjectData.shortDescriptions[1],
                                    width: 450,
                                    device: Icons.computer,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(HeroDialogRoute(
                                      builder: (context) {
                                        return FullProject(
                                          index: 0,
                                          text: ProjectData.descriptions[2],
                                          icon: 'sorting',
                                          tag: 'sorting',
                                          isGif: false,
                                          isPhone: false,
                                          title: ProjectData.titles[2],
                                          device: Icons.phone_iphone,
                                          images: 0,
                                          videoURL:
                                              'images/sorting/sorting.mp4',
                                        );
                                      },
                                      settings: RouteSettings(name: "test"),
                                    ));
                                  },
                                  child: ProjectIcon(
                                      icon: "sorting",
                                      title: ProjectData.titles[2],
                                      description:
                                          ProjectData.shortDescriptions[2],
                                      width: 450,
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

    if (MediaQuery.of(context).size.width > 1000)
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
                height: getHeight(),
                color: ColorPalette.white,
                child: Stack(
                  children: [
                    Transform.translate(
                      offset: Offset(0, offset),
                      child: Container(
                        height: getHeader(),
                        child: Center(
                          child: Text(
                            "Projects",
                            style: TextStyle(
                              fontSize: titleSize,
                              color: ColorPalette.lightGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: contentOffset,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.deepOrange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Spacer(),
                                  // Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(HeroDialogRoute(
                                        builder: (context) {
                                          return FullProject(
                                            index: 0,
                                            title: ProjectData.titles[0],
                                            text: ProjectData.descriptions[0],
                                            icon: 'reelcaster',
                                            tag: 'reelcaster',
                                            device: Icons.phone_iphone,
                                            images: 4,
                                            isGif: false,
                                            isPhone: true,
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
                                      description:
                                          ProjectData.shortDescriptions[0],
                                      width: 450,
                                      device: Icons.phone_iphone,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(HeroDialogRoute(
                                        builder: (context) {
                                          return FullProject(
                                            index: 0,
                                            text: ProjectData.descriptions[1],
                                            icon: 'sudoku',
                                            tag: 'sudoku',
                                            title: ProjectData.titles[1],
                                            device: Icons.computer,
                                            isGif: true,
                                            isPhone: false,
                                            images: 2,
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
                                      description:
                                          ProjectData.shortDescriptions[1],
                                      width: 450,
                                      device: Icons.computer,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(HeroDialogRoute(
                                        builder: (context) {
                                          return FullProject(
                                            index: 0,
                                            text: ProjectData.descriptions[2],
                                            icon: 'sorting',
                                            tag: 'sorting',
                                            isGif: false,
                                            isPhone: false,
                                            title: ProjectData.titles[2],
                                            device: Icons.phone_iphone,
                                            images: 0,
                                          );
                                        },
                                        settings: RouteSettings(name: "test"),
                                      ));
                                    },
                                    child: ProjectIcon(
                                        icon: "sorting",
                                        title: ProjectData.titles[2],
                                        description:
                                            ProjectData.shortDescriptions[2],
                                        width: 450,
                                        device: Icons.phone_iphone),
                                  ),
                                ],
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
    if (MediaQuery.of(context).size.width > 550)
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
                height: getHeight(),
                color: ColorPalette.white,
                child: Stack(
                  children: [
                    Transform.translate(
                      offset: Offset(0, offset),
                      child: Container(
                        height: getHeader(),
                        child: Center(
                          child: Text(
                            "Projects",
                            style: TextStyle(
                              fontSize: titleSize,
                              color: ColorPalette.lightGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: contentOffset,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.deepOrange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: GestureDetector(
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
                                        isGif: false,
                                        isPhone: true,
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
                                  width: 400,
                                  device: Icons.phone_iphone,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: GestureDetector(
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
                                        isGif: true,
                                        isPhone: false,
                                        images: 2,
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
                                  width: 400,
                                  device: Icons.computer,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(HeroDialogRoute(
                                    builder: (context) {
                                      return FullProject(
                                        index: 0,
                                        text: ProjectData.descriptions[2],
                                        icon: 'sorting',
                                        tag: 'sorting',
                                        isGif: false,
                                        isPhone: false,
                                        title: ProjectData.titles[2],
                                        device: Icons.phone_iphone,
                                        images: 0,
                                      );
                                    },
                                    settings: RouteSettings(name: "test"),
                                  ));
                                },
                                child: ProjectIcon(
                                    icon: "sorting",
                                    title: ProjectData.titles[2],
                                    description:
                                        ProjectData.shortDescriptions[2],
                                    width: 400,
                                    device: Icons.phone_iphone),
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
              height: getHeight(),
              color: ColorPalette.white,
              child: Stack(
                children: [
                  Transform.translate(
                    offset: Offset(0, offset),
                    child: Container(
                      height: getHeader(),
                      child: Center(
                        child: Text(
                          "Projects",
                          style: TextStyle(
                            fontSize: titleSize,
                            color: ColorPalette.lightGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: contentOffset,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.deepOrange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: GestureDetector(
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
                                      isGif: false,
                                      isPhone: true,
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
                                width: 350,
                                device: Icons.phone_iphone,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: GestureDetector(
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
                                      isGif: true,
                                      isPhone: false,
                                      images: 2,
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
                                width: 350,
                                device: Icons.computer,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(HeroDialogRoute(
                                  builder: (context) {
                                    return FullProject(
                                      index: 0,
                                      text: ProjectData.descriptions[2],
                                      icon: 'sorting',
                                      tag: 'sorting',
                                      isGif: false,
                                      isPhone: false,
                                      title: ProjectData.titles[2],
                                      device: Icons.phone_iphone,
                                      images: 0,
                                    );
                                  },
                                  settings: RouteSettings(name: "test"),
                                ));
                              },
                              child: ProjectIcon(
                                  icon: "sorting",
                                  title: ProjectData.titles[2],
                                  description: ProjectData.shortDescriptions[2],
                                  width: 350,
                                  device: Icons.phone_iphone),
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
