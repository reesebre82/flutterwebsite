import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';
import 'package:website/containers/Home/HomeContainer.dart';
import 'package:website/containers/About/AboutContainer.dart';
import 'package:website/controllers/ScrollerController.dart';
import 'containers/Project/ProjectContainer.dart';
import 'containers/Skills/SkillsContainer.dart';
import 'containers/Education/EducationContainer.dart';
import 'containers/Contact/ContactContainer.dart';
import 'containers/Resume/ResumeContainer.dart';

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    // executeAfterBuild();

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        HomeContainer(),
        AboutContainer(),
        ProjectContainer(),
        SkillsContainer(),
        EducationContainer(),
        ContactContainer(),
        ResumeContainer(),
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
