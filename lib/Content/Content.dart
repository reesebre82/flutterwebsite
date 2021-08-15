import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/Content/PhoneContent.dart';
import 'package:website/Responsive.dart';
import 'package:website/containers/Home/HomeContainer.dart';
import 'package:website/containers/About/AboutContainer.dart';
import 'package:website/containers/Project/FullProject.dart';
import 'package:website/controllers/AboutAnimationController.dart';
import 'package:website/controllers/EducationAnimationController.dart';
import 'package:website/controllers/PhoneMenuController.dart';
import '../controllers/PageViewController.dart';
import '../containers/Project/ProjectContainer.dart';
import '../containers/Skills/SkillsContainer.dart';
import '../containers/Education/EducationContainer.dart';
import '../containers/Contact/ContactContainer.dart';
import '../containers/Resume/ResumeContainer.dart';

class Content extends StatefulWidget {
  Content({Key? key}) : super(key: key);
  @override
  ContentState createState() => ContentState();
}

class ContentState extends State<Content> with SingleTickerProviderStateMixin {
  late ScrollController scrollController;
  bool showFullPage = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    context.read<AboutAnimationController>().setScreenHeight(screenHeight);
    context.read<EducationAnimationController>().setScreenHeight(screenHeight);
    context.read<PageViewController>().setScreenHeight(screenHeight);

    scrollController = ScrollController()
      ..addListener(() {
        context
            .read<PhoneMenuController>()
            .updateScrollOffset(scrollController.offset);
        context
            .read<PageViewController>()
            .updateScrollPosition(scrollController.offset);
        context
            .read<AboutAnimationController>()
            .updateScrollPosition(scrollController.offset);
        context
            .read<EducationAnimationController>()
            .updateScrollPosition(scrollController.offset);
        print(scrollController.offset);
      });

    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: ColorPalette.mediumTurquise,
        ),
        CustomScrollView(
          controller: scrollController,
          physics: ClampingScrollPhysics(),
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
          PhoneContent(
            key: context.read<PhoneMenuController>().phoneMenuKey,
            clickable: true,
          ),
      ],
    );
  }
}
