import 'dart:html';

import 'package:flutter/material.dart';
import 'package:website/containers/About/AboutContainer.dart';
import 'package:website/containers/Contact/ContactContainer.dart';
import 'package:website/containers/Education/EducationContainer.dart';
import 'package:website/containers/Project/ProjectContainer.dart';
import 'package:website/containers/Resume/ResumeContainer.dart';
import 'package:website/containers/Skills/SkillsContainer.dart';
import 'package:website/containers/Home/HomeContainer.dart';

class PageViewController extends ChangeNotifier {
  final GlobalKey<AboutContainerState> _aboutPageKey =
      GlobalKey<AboutContainerState>();
  GlobalKey<AboutContainerState> get aboutPageKey => _aboutPageKey;

  final GlobalKey<HomeContainerState> _homePageKey =
      GlobalKey<HomeContainerState>();
  GlobalKey<HomeContainerState> get homePageKey => _homePageKey;

  final GlobalKey<ProjectContainerState> _projectPageKey =
      GlobalKey<ProjectContainerState>();
  GlobalKey<ProjectContainerState> get projectPageKey => _projectPageKey;

  final GlobalKey<SkillsContainerState> _skillsPageKey =
      GlobalKey<SkillsContainerState>();
  GlobalKey<SkillsContainerState> get skillsPageKey => _skillsPageKey;

  final GlobalKey<EducationContainerState> _educationPageKey =
      GlobalKey<EducationContainerState>();
  GlobalKey<EducationContainerState> get educationPageKey => _educationPageKey;

  final GlobalKey<ContactContainerState> _contactPageKey =
      GlobalKey<ContactContainerState>();
  GlobalKey<ContactContainerState> get contactPageKey => _contactPageKey;

  final GlobalKey<ResumeContainerState> _resumePageKey =
      GlobalKey<ResumeContainerState>();
  GlobalKey<ResumeContainerState> get resumePageKey => _resumePageKey;

  int page = 0;
  double _scrollPosition = 0.0;

  double get scrollPosition => _scrollPosition;

  void setPage(newPage) {
    page = newPage;
    switch (page) {
      case 0:
        Scrollable.ensureVisible(
          _homePageKey.currentContext!,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        );
        break;
      case 1:
        Scrollable.ensureVisible(
          _aboutPageKey.currentContext!,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        );
        break;
      case 2:
        Scrollable.ensureVisible(
          _projectPageKey.currentContext!,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        );
        break;
      case 3:
        Scrollable.ensureVisible(
          _skillsPageKey.currentContext!,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        );
        break;
      case 4:
        Scrollable.ensureVisible(
          _educationPageKey.currentContext!,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        );
        break;
      case 5:
        Scrollable.ensureVisible(
          _contactPageKey.currentContext!,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        );
        break;
      case 6:
        Scrollable.ensureVisible(
          _resumePageKey.currentContext!,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        );
        break;
      default:
        break;
    }
  }

  int resume() {
    return 6;
  }

  int about() {
    return 1;
  }

  int project() {
    return 2;
  }

  int skills() {
    return 3;
  }

  int education() {
    return 4;
  }

  int contact() {
    return 5;
  }

  void updateScrollPosition(double offset) {
    _scrollPosition = offset;
    notifyListeners();
  }
}
