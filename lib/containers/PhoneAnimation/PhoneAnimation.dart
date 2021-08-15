import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/containers/Project/FullProject.dart';
import 'package:website/containers/Project/HeroDialogRoute.dart';
import 'package:website/containers/Project/ProjectData.dart';
import 'package:website/controllers/PageViewController.dart';
import 'package:website/controllers/PhoneMenuController.dart';

import 'PhoneIcon.dart';

class PhoneAnimation extends StatefulWidget {
  final double height;
  final double width;
  final bool clickable;
  PhoneAnimation(
      {required this.height, required this.width, required this.clickable});
  @override
  _PhoneAnimationState createState() => _PhoneAnimationState();
}

class _PhoneAnimationState extends State<PhoneAnimation> {
  double xOffset = 0;
  double yOffset = 0;

  @override
  void initState() {
    super.initState();
  }

  double getXOffset(double index) {
    return ((widget.width / 5) * (index + 1)) - widget.width / 12.5;
  }

  double getYOffset(double index) {
    return (widget.height / 8) * (index + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.height,
          child: Stack(
            children: [
              Positioned(
                top: widget.height * 0.1,
                left: widget.width * 0.04,
                child: Container(
                  width: widget.width * 0.925,
                  height: widget.height * 0.78,
                  color: ColorPalette.darkGrey,
                ),
              ),
              Image(
                height: widget.height,
                width: widget.width,
                image: AssetImage(
                    'images/icons/PhoneAnimationIcons/phoneicon.png'),
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
        Positioned(
          top: getYOffset(0),
          left: getXOffset(0),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            iconData: Icons.person,
            newScreen: 1,
            title: "About",
            color: ColorPalette.getTheme(0),
          ),
        ),
        Positioned(
          top: getYOffset(0),
          left: getXOffset(1),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            iconData: Icons.account_tree,
            newScreen: 2,
            title: "Projects",
            color: ColorPalette.getTheme(3),
          ),
        ),
        Positioned(
          top: getYOffset(0),
          left: getXOffset(2),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            iconData: Icons.school,
            newScreen: 4,
            title: "Education",
            color: ColorPalette.getTheme(2),
          ),
        ),
        Positioned(
          top: getYOffset(0),
          left: getXOffset(3),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            iconData: Icons.contact_mail,
            newScreen: 5,
            title: "Contact",
            color: ColorPalette.getTheme(3),
          ),
        ),
        //SECOND ROW
        Positioned(
          top: getYOffset(1),
          left: getXOffset(0),
          child: PhoneIcon(
            icon: 0,
            height: widget.height,
            iconData: Icons.description,
            newScreen: 6,
            title: "Resume",
            color: ColorPalette.getTheme(2),
          ),
        ),
        Positioned(
          top: getYOffset(1),
          left: getXOffset(1),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(HeroDialogRoute(
                builder: (context) {
                  return FullProject(
                    index: 0,
                    text: ProjectData.descriptions[0],
                    icon: 'reelcaster',
                    tag: 'phone-reelcaster',
                    title: ProjectData.titles[0],
                    device: Icons.phone_iphone,
                    images: 4,
                    isGif: false,
                    isPhone: true,
                    videoURL: 'images/reelcaster/reelcastervideo.mov',
                    githubURL: 'https://github.com/reesebre82/ReelCaster',
                  );
                },
                settings: RouteSettings(name: "test"),
              ));
            },
            child: PhoneIcon(
              icon: 5,
              height: widget.height,
              title: "Reelcaster",
              color: Colors.white,
              image: "reelcaster",
            ),
          ),
        ),
        Positioned(
          top: getYOffset(1),
          left: getXOffset(2),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(HeroDialogRoute(
                builder: (context) {
                  return FullProject(
                    index: 0,
                    text: ProjectData.descriptions[1],
                    icon: 'sudoku',
                    tag: 'phone-sudoku',
                    title: ProjectData.titles[1],
                    device: Icons.computer,
                    images: 2,
                    isGif: true,
                    isPhone: false,
                    githubURL: 'https://github.com/reesebre82/SudokuSolver',
                  );
                },
                settings: RouteSettings(name: "test"),
              ));
            },
            child: PhoneIcon(
              icon: 5,
              height: widget.height,
              title: "Sudoku",
              color: Colors.white,
              image: "sudoku",
            ),
          ),
        ),
        Positioned(
          top: getYOffset(1),
          left: getXOffset(3),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(HeroDialogRoute(
                builder: (context) {
                  return FullProject(
                    index: 0,
                    text: ProjectData.descriptions[2],
                    icon: 'sorting',
                    tag: 'phone-sorting',
                    isGif: false,
                    isPhone: false,
                    title: ProjectData.titles[2],
                    device: Icons.phone_iphone,
                    images: 0,
                    videoURL: 'images/sorting/sorting.mp4',
                  );
                },
                settings: RouteSettings(name: "test"),
              ));
            },
            child: PhoneIcon(
              icon: 5,
              height: widget.height,
              title: "Sortng",
              color: Colors.white,
              image: "sorting",
            ),
          ),
        ),
        //Third row
        Positioned(
          top: getYOffset(2),
          left: getXOffset(0),
          child: PhoneIcon(
            icon: 4,
            height: widget.height,
            newScreen: 3,
            color: ColorPalette.getTheme(5),
          ),
        ),
        // Positioned(
        //   top: getYOffset(2),
        //   left: getXOffset(2),
        //   child: PhoneIcon(icon: 1, height: widget.height),
        // ),
        // Positioned(
        //   top: getYOffset(2),
        //   left: getXOffset(3),
        //   child: PhoneIcon(icon: 0, height: widget.height),
        // ),
        // Positioned(
        //   top: getYOffset(3),
        //   left: getXOffset(2),
        //   child: PhoneIcon(icon: 0, height: widget.height),
        // ),
        // Positioned(
        //   top: getYOffset(3),
        //   left: getXOffset(3),
        //   child: PhoneIcon(icon: 1, height: widget.height),
        // ),
        // // //Forth Row
        // Positioned(
        //   top: getYOffset(4.1),
        //   left: getXOffset(2.1),
        //   child: PhoneIcon(icon: 3, height: widget.height),
        // ),
        // Positioned(
        //   top: getYOffset(4),
        //   left: getXOffset(0),
        //   child: PhoneIcon(icon: 1, height: widget.height),
        // ),
        // Positioned(
        //   top: getYOffset(4),
        //   left: getXOffset(1),
        //   child: PhoneIcon(icon: 0, height: widget.height),
        // ),
        // Positioned(
        //   top: getYOffset(5),
        //   left: getXOffset(0),
        //   child: PhoneIcon(icon: 1, height: widget.height),
        // ),
        // Positioned(
        //   top: getYOffset(5),
        //   left: getXOffset(1),
        //   child: PhoneIcon(icon: 0, height: widget.height),
        // ),

        Positioned(
          bottom: 20,
          child: Container(
            width: widget.width,
            height: widget.height * 0.1,
            child: Center(
              child: InkWell(
                onTap: () {
                  var phoneController =
                      Provider.of<PhoneMenuController>(context, listen: false);
                  if (phoneController.toggled) {
                    phoneController.toggle();
                  }
                  var pageController =
                      Provider.of<PageViewController>(context, listen: false);
                  pageController.setPage(0);
                },
                child: Container(
                  width: widget.width * 0.9,
                  height: widget.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: ColorPalette.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
        if (!widget.clickable)
          Container(
            height: widget.height,
            width: widget.width,
            child: AbsorbPointer(),
          )
      ],
    );
  }
}
