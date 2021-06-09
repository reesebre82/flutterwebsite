import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:website/containers/Home/HomeContainer.dart';
import 'package:website/containers/About/AboutContainer.dart';
import 'containers/Project/ProjectContainer.dart';
import 'containers/Skills/SkillsContainer.dart';
import 'containers/Education/EducationContainer.dart';
import 'containers/Contact/ContactContainer.dart';
import 'containers/Resume/ResumeContainer.dart';

class Content extends StatelessWidget {
  final _sliverController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _sliverController,
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
}
