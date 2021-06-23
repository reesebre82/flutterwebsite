import 'dart:html';

import 'package:flutter/material.dart';
import 'package:website/ColorPalette.dart';
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
  double screenHeight = 0.0;

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

  setScreenHeight(double height) {
    screenHeight = height;
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

  double getHeight(int index) {
    switch (index) {
      case 0:
        if (_homePageKey.currentState != null)
          return _homePageKey.currentState!.getHeight();
        return 0.0;
      case 1:
        if (_aboutPageKey.currentState != null)
          return _aboutPageKey.currentState!.getHeight();
        return 0.0;
      case 2:
        if (_projectPageKey.currentState != null)
          return _projectPageKey.currentState!.getHeight();
        return 0.0;
      case 3:
        if (_skillsPageKey.currentState != null)
          return _skillsPageKey.currentState!.getHeight();
        return 0.0;
      case 4:
        if (_educationPageKey.currentState != null)
          return _educationPageKey.currentState!.getHeight();
        return 0.0;
      case 5:
        if (_contactPageKey.currentState != null)
          return _contactPageKey.currentState!.getHeight();
        return 0.0;
      case 6:
        if (_resumePageKey.currentState != null)
          return _resumePageKey.currentState!.getHeight();
        return 0.0;
      default:
        return 0.0;
    }
  }

  double getCombinedHeight(int index) {
    double returnValue = 0.0;

    if (_homePageKey.currentState != null)
      returnValue += _homePageKey.currentState!.getHeight();
    if (index == 0) return returnValue;

    if (_aboutPageKey.currentState != null)
      returnValue += _aboutPageKey.currentState!.getHeight();
    if (index == 1) return returnValue;

    if (_projectPageKey.currentState != null)
      returnValue += _projectPageKey.currentState!.getHeight();
    if (index == 2) return returnValue;

    if (_skillsPageKey.currentState != null)
      returnValue += _skillsPageKey.currentState!.getHeight();
    if (index == 3) return returnValue;

    if (_educationPageKey.currentState != null)
      returnValue += _educationPageKey.currentState!.getHeight();
    if (index == 4) return returnValue;

    if (_contactPageKey.currentState != null)
      returnValue += _contactPageKey.currentState!.getHeight();
    if (index == 5) return returnValue;

    if (_resumePageKey.currentState != null)
      returnValue += _resumePageKey.currentState!.getHeight();
    if (index == 6) return returnValue;

    return returnValue;
  }

  int section = 0;

  double getTransitionKey() {
    double transition = 0.0;
    for (int i = 0; i < 7; i++) {
      if (i >= 1) {
        transition =
            (_scrollPosition - getCombinedHeight(i - 1)) / getHeight(i);
      } else {
        transition = _scrollPosition / getHeight(i);
      }
      if (transition <= 1.00) {
        return transition;
      }
    }

    return 0.0;
  }

  Color getStartColor() {
    switch (section) {
      case 0:
        return ColorPalette.mediumTurquise;
      case 1:
        return ColorPalette.darkJungleGreen;
      case 2:
        return ColorPalette.blueMunsell;
      case 3:
        return ColorPalette.mediumTurquise;
      case 4:
        return ColorPalette.darkJungleGreen;
      case 5:
        return ColorPalette.blueMunsell;
      case 6:
        return ColorPalette.mediumTurquise;
      default:
        return Colors.black;
    }
  }

  Color getEndColor() {
    switch (section) {
      case 0:
        return ColorPalette.darkJungleGreen;
      case 1:
        return ColorPalette.blueMunsell;
      case 2:
        return ColorPalette.mediumTurquise;
      case 3:
        return ColorPalette.darkJungleGreen;
      case 4:
        return ColorPalette.blueMunsell;
      case 5:
        return ColorPalette.mediumTurquise;
      case 6:
        return ColorPalette.darkJungleGreen;
      default:
        return Colors.black;
    }
  }

  void getSection() {
    if (getCombinedHeight(0) >= _scrollPosition) {
      section = 0;
    } else if (getCombinedHeight(1) >= _scrollPosition) {
      section = 1;
    } else if (getCombinedHeight(2) >= _scrollPosition) {
      section = 2;
    } else if (getCombinedHeight(3) >= _scrollPosition) {
      section = 3;
    } else if (getCombinedHeight(4) >= _scrollPosition) {
      section = 4;
    } else if (getCombinedHeight(5) >= _scrollPosition) {
      section = 5;
    } else if (getCombinedHeight(6) >= _scrollPosition) {
      section = 6;
    } else {
      section = 0;
    }
  }

  Color getBackgroundColor() {
    getSection();
    double transition = getTransitionKey();
    Color? returnColor = Color.lerp(getStartColor(), getEndColor(), transition);

    print(_scrollPosition);
    return returnColor ?? ColorPalette.ceruleanBlue;
  }

  void updateScrollPosition(double offset) {
    _scrollPosition = offset;
    notifyListeners();
  }
}
