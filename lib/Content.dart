import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/Responsive.dart';
import 'package:website/containers/Home/HomeContainer.dart';
import 'package:website/containers/About/AboutContainer.dart';
import 'package:website/controllers/PhoneMenuController.dart';
import 'containers/PhoneAnimation/PhoneAnimation.dart';
import 'controllers/PageViewController.dart';
import 'containers/Project/ProjectContainer.dart';
import 'containers/Skills/SkillsContainer.dart';
import 'containers/Education/EducationContainer.dart';
import 'containers/Contact/ContactContainer.dart';
import 'containers/Resume/ResumeContainer.dart';

class Content extends StatefulWidget {
  Content({Key? key}) : super(key: key);
  @override
  ContentState createState() => ContentState();
}

class ContentState extends State<Content> {
  late ScrollController _scrollController;
  var state = 0;
  var test = 0;

  @override
  Widget build(BuildContext context) {
    double phoneHeight = 500;
    double phoneWidth = 275;
    double screenWidth = MediaQuery.of(context).size.width;
    context.read<PhoneMenuController>().setPhoneHeight(phoneHeight);
    context.read<PhoneMenuController>().setPhoneWidth(phoneWidth);
    context.read<PhoneMenuController>().setScreenWidth(screenWidth);

    final phoneMenuController = Provider.of<PhoneMenuController>(context);
    double offsetX = phoneMenuController.scrollOffsetX;

    _scrollController = ScrollController()
      ..addListener(() {
        context
            .read<PhoneMenuController>()
            .updateScrollOffset(_scrollController.offset);
        context
            .read<PageViewController>()
            .updateScrollPosition(_scrollController.offset);
      });
    // executeAfterBuild();
    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            HomeContainer(key: context.read<PageViewController>().homePageKey),
            AboutContainer(
                key: context.read<PageViewController>().aboutPageKey),
            ProjectContainer(
                key: context.read<PageViewController>().projectPageKey),
            SkillsContainer(
                key: context.read<PageViewController>().skillsPageKey),
            EducationContainer(
                key: context.read<PageViewController>().educationPageKey),
            ContactContainer(
                key: context.read<PageViewController>().contactPageKey),
            ResumeContainer(
                key: context.read<PageViewController>().resumePageKey),
          ],
        ),
        if (Responsive.isDesktop(context))
          Transform.translate(
            offset: Offset(-offsetX, 0),
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: PhoneAnimation(height: phoneHeight, width: phoneWidth),
              ),
            ),
          ),
        if (Responsive.isDesktop(context))
          if (context.read<PhoneMenuController>().isClosed())
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: 15,
              child: FloatingActionButton(
                onPressed: () {
                  context.read<PhoneMenuController>().toggle();
                },
              ),
            )
      ],
    );
  }

  // Future<void> executeAfterBuild() async {
  //   final scrollerController = Provider.of<ScrollerController>(context);
  //   setState(() {
  //     _scrollController.jumpTo(scrollerController.scrollValue);
  //   });
  // }
}
