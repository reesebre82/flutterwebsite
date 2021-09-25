import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/Responsive.dart';
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
    if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
      return MediaQuery.of(context).size.height * 1.25;
    }
    return MediaQuery.of(context).size.height * 2.0;
  }

  double getHeader() {
    if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
      return MediaQuery.of(context).size.height * 0.25;
    }
    return MediaQuery.of(context).size.height * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    var aboutController = Provider.of<AboutAnimationController>(context);
    var pageViewController = Provider.of<PageViewController>(context);
    aboutController.setToggleHeight(pageViewController.getCombinedHeight(0));

    double offset =
        pageViewController.getMovingOffset(1, getHeader(), getHeight());

    double centerOffset = 250;
    double titleSize = 350;
    double titleHeight = getHeader();

    if (MediaQuery.of(context).size.width > 1500) {
      titleSize = 325;
    } else if (MediaQuery.of(context).size.width > 1400) {
      titleSize = 275;
    } else if (MediaQuery.of(context).size.width > 1000) {
      titleSize = 200;
      centerOffset = 125;
    } else if (MediaQuery.of(context).size.width > 550) {
      titleSize = 115;
      centerOffset = 0;
    } else {
      titleSize = 75;
      centerOffset = 0;
    }

    return SliverStickyHeader(
      header: Container(
        height: 0,
        // child: Header(title: "About Me", showMenu: false),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              height: getHeight(),
              width: MediaQuery.of(context).size.width,
              color: ColorPalette.blueMunsell,
              child: Stack(
                children: [
                  Transform.translate(
                    offset: Offset(0, offset),
                    child: Container(
                      height: getHeader(),
                      child: Center(
                        child: Text(
                          "About Me",
                          style: TextStyle(
                            fontSize: titleSize,
                            color: ColorPalette.lightBlueMunsell,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 360,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (aboutController.animated[0])
                            AboutBoxAnimation(
                              centerOffset: centerOffset,
                              fromLeft: true,
                              width: 400,
                              height: 250,
                              title: "The Start",
                              text:
                                  "    Hello! My name is Brendan Reese and I love building applications. I am a newly graduate with a bachelors degree in computer science, and I am extremely excited to get into the world of software development to build a better codebase for tomorrow.\n\n    My ambition for software initially sparked when I was 13 years old. I remember dropping and cracking the screen of my first smartphone. Instead of buying a new phone, or paying someone to fix the phone, I started tinkering and in no time the phone was completely in pieces on my table. After putting the phone back together with a new screen, and seeing the boot logo appear, I was hooked on technology.",
                            ),
                          if (aboutController.animated[1])
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: AboutBoxAnimation(
                                centerOffset: centerOffset,
                                fromLeft: false,
                                width: 400,
                                height: 320,
                                title: "Hardware to Software",
                                text:
                                    "    I knew I loved technology, but even from a young age I strived to make a difference. New hardware pushes technology forward, but I quickly found that without software, hardware is a bunch of copper and silicon. I wanted to learn how to program and I sparked a craving to launch an Application onto an App Store for the world to download. \n\n    After taking beginner courses in high school, I determined that the best way for me to start making a phone app is to just start. With the default Hello World application created in Swift, I immediately turn my mindset into the next project: Tic Tac Toe. Tic Tac Toe was the first full application I built, but I was determined to make the program unbeatable. At the time I didn’t realize it, but I wrote a small Artificial Intelligence program to detect all possible moves to make sure my Tic Tac Toe program would always beat the user.",
                              ),
                            ),
                          if (aboutController.animated[2])
                            AboutBoxAnimation(
                              centerOffset: centerOffset,
                              fromLeft: true,
                              width: 400,
                              height: 170,
                              title: "Practice Makes Perfect",
                              text:
                                  "    Once I hustled all of my friends on beating my program, I decided to move onto games and productivity applications(some of which were posted on the iOS App Store). I typically started with a programming concept I wanted to learn, and then built a whole application upon that idea. At this point in 2017,  I developed iOS applications for small businesses and got to the point where I felt I was able to program an application based on any type of request given.",
                            ),
                          if (aboutController.animated[3])
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: AboutBoxAnimation(
                                centerOffset: centerOffset,
                                fromLeft: false,
                                width: 400,
                                height: 335,
                                title: "Trasition Into Professional Career",
                                text:
                                    "    Although I felt like I could overcome any programming challenge, I felt like I needed to know how customers really use a system. I won over HR managers at Apple and took an extremely competitive job as an At Home Advisor. On this job I learned the biggest stumbles and issues of an operating system. I learned not only how to communicate with customers, but also how to prevent customer frustrations in the first place. Apple was the perfect place for me to understand the consumer part of a program.\n\n    After graduating college, I’ve never been more prepared to start updating the codebase for a company. I have spent all of college mentoring others and helping improve the development process for peers. Although I feel accomplished for the tasks I’ve taken, I feel there is so much more to learn and I’m excited to learn from experience by working in a team. I feel as if I’m a perfect candidate for a software developer position and I’m ready to impress as I take on new challenges.",
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
