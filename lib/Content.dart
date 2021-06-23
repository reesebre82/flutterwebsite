import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/Responsive.dart';
import 'package:website/containers/Home/HomeContainer.dart';
import 'package:website/containers/About/AboutContainer.dart';
import 'package:website/controllers/AboutAnimationController.dart';
import 'package:website/controllers/EducationAnimationController.dart';
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

class ContentState extends State<Content> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation _animation;
  late bool isPhoneOpen = false;
  var state = 0;
  var test = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  openPhone() {
    _animationController.forward();
    isPhoneOpen = true;
  }

  closePhone() {
    _animationController.reverse();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double phoneHeight = 500;
    double phoneWidth = 275;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    context.read<PhoneMenuController>().setPhoneHeight(phoneHeight);
    context.read<PhoneMenuController>().setPhoneWidth(phoneWidth);
    context.read<PhoneMenuController>().setScreenWidth(screenWidth);
    context.read<AboutAnimationController>().setScreenHeight(screenHeight);
    context.read<EducationAnimationController>().setScreenHeight(screenHeight);
    context.read<PageViewController>().setScreenHeight(screenHeight);

    final phoneMenuController = Provider.of<PhoneMenuController>(context);
    double offsetX = phoneMenuController.scrollOffsetX;

    _animation = Tween(
            begin: -context.read<PhoneMenuController>().getBeginOffset(),
            end: -context.read<PhoneMenuController>().getEndOffset())
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeOut));
    _animationController.addListener(() {
      setState(() {});
    });

    _scrollController = ScrollController()
      ..addListener(() {
        context
            .read<PhoneMenuController>()
            .updateScrollOffset(_scrollController.offset);
        context
            .read<PageViewController>()
            .updateScrollPosition(_scrollController.offset);
        context
            .read<AboutAnimationController>()
            .updateScrollPosition(_scrollController.offset);
        context
            .read<EducationAnimationController>()
            .updateScrollPosition(_scrollController.offset);
      });
    // executeAfterBuild();
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: context.read<PageViewController>().getBackgroundColor(),
        ),
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
          if (!isPhoneOpen)
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
          if (isPhoneOpen)
            Transform.translate(
              offset: Offset(_animation.value, 0),
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
                backgroundColor: ColorPalette.mediumTurquise,
                onPressed: () {
                  context.read<PhoneMenuController>().toggle();
                },
              ),
            ),
        if (Responsive.isDesktop(context))
          if (!context.read<PhoneMenuController>().isClosed())
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: 15,
              child: Opacity(
                opacity: context.read<PhoneMenuController>().getButtonOpactiy(),
                child: FloatingActionButton(
                  backgroundColor: ColorPalette.mediumTurquise,
                  onPressed: () {},
                ),
              ),
            ),
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
