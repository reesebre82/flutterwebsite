import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/controllers/PageViewController.dart';

class PhoneIcon extends StatefulWidget {
  int icon;
  double height;
  Image? image;
  IconData? iconData;
  int? newScreen;
  PhoneIcon(
      {required this.icon,
      required this.height,
      this.iconData,
      this.image,
      this.newScreen});

  @override
  _PhoneIconState createState() => _PhoneIconState();
}

class _PhoneIconState extends State<PhoneIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> animation;
  late bool shouldAnimate;
  late int durationLength;
  bool isDone = false;

  @override
  void initState() {
    super.initState();
    durationLength = Random().nextInt(5) + 2;
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: durationLength));
    shouldAnimate = Random().nextBool();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        createNewAnimation();
      }
    });

    animation =
        Tween(begin: Offset.zero, end: Offset.zero).animate(_controller);

    createNewAnimation();
  }

  createNewAnimation() {
    if (!isDone) {
      shouldAnimate = false;
      int shouldAnimateInt = Random().nextInt(100);
      if (shouldAnimateInt > 75) {
        shouldAnimate = true;
      }
      if (shouldAnimate) {
        double xOffset = (Random().nextDouble() * (0.35 - 0.0) + 0.0) - 0.175;
        double yOffset = (Random().nextDouble() * (0.35 - 0.0) + 0.0) - 0.175;
        animation = Tween(begin: Offset.zero, end: Offset(xOffset, yOffset))
            .animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
        _controller.forward();
      } else {
        Future.delayed(const Duration(milliseconds: 2000), () {
          createNewAnimation();
        });
      }
    }
  }

  Widget getWidget() {
    switch (widget.icon) {
      case 0:
        return Stack(
          children: [
            if (widget.iconData != null || widget.image != null)
              Container(
                width: widget.height * 0.0875,
                height: widget.height * 0.0875,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Icon(
                  widget.iconData,
                  size: 30,
                ),
              ),
            if (widget.iconData != null || widget.image != null)
              InkWell(
                onTap: () {
                  var pageController =
                      Provider.of<PageViewController>(context, listen: false);
                  pageController.setPage(widget.newScreen);
                },
                child: Image(
                    image: AssetImage(
                        'images/icons/PhoneAnimationIcons/appicon.png'),
                    fit: BoxFit.fitHeight,
                    height: widget.height * 0.0875),
              ),
            if (widget.iconData == null && widget.image == null)
              Image(
                  image: AssetImage(
                      'images/icons/PhoneAnimationIcons/appicon.png'),
                  fit: BoxFit.fitHeight,
                  height: widget.height * 0.0875),
          ],
        );
      case 1:
        return Stack(
          children: [
            if (widget.iconData != null || widget.image != null)
              Container(
                width: widget.height * 0.0875,
                height: widget.height * 0.0875,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Icon(
                  widget.iconData,
                  size: 30,
                ),
              ),
            if (widget.iconData != null || widget.image != null)
              InkWell(
                onTap: () {
                  var pageController =
                      Provider.of<PageViewController>(context, listen: false);
                  pageController.setPage(widget.newScreen);
                },
                child: Image(
                    image: AssetImage(
                        'images/icons/PhoneAnimationIcons/appiconwithline.png'),
                    fit: BoxFit.fitHeight,
                    height: widget.height * 0.0875),
              ),
            if (widget.iconData == null && widget.image == null)
              Image(
                  image: AssetImage(
                      'images/icons/PhoneAnimationIcons/appiconwithline.png'),
                  fit: BoxFit.fitHeight,
                  height: widget.height * 0.0875),
          ],
        );
      case 2:
        return Stack(
          children: [
            if (widget.iconData != null || widget.image != null)
              Container(
                width: widget.height * 0.19,
                height: widget.height * 0.19,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Icon(
                  widget.iconData,
                  size: 35,
                ),
              ),
            if (widget.iconData != null || widget.image != null)
              InkWell(
                onTap: () {
                  var pageController =
                      Provider.of<PageViewController>(context, listen: false);
                  pageController.setPage(widget.newScreen);
                },
                child: Image(
                    image: AssetImage(
                        'images/icons/PhoneAnimationIcons/appicon.png'),
                    fit: BoxFit.fill,
                    height: widget.height * 0.19,
                    width: widget.height * 0.19),
              ),
            if (widget.iconData == null && widget.image == null)
              Image(
                  image: AssetImage(
                      'images/icons/PhoneAnimationIcons/appicon.png'),
                  fit: BoxFit.fill,
                  height: widget.height * 0.19,
                  width: widget.height * 0.19),
          ],
        );
      case 3:
        return Stack(
          children: [
            if (widget.iconData != null || widget.image != null)
              Container(
                width: widget.height * 0.19,
                height: widget.height * 0.19,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Icon(
                  widget.iconData,
                  size: 35,
                ),
              ),
            if (widget.iconData != null || widget.image != null)
              InkWell(
                onTap: () {
                  var pageController =
                      Provider.of<PageViewController>(context, listen: false);
                  pageController.setPage(widget.newScreen);
                },
                child: Image(
                    image: AssetImage(
                        'images/icons/PhoneAnimationIcons/appiconwithline.png'),
                    fit: BoxFit.fill,
                    height: widget.height * 0.19,
                    width: widget.height * 0.19),
              ),
            if (widget.iconData == null && widget.image == null)
              Image(
                  image: AssetImage(
                      'images/icons/PhoneAnimationIcons/appiconwithline.png'),
                  fit: BoxFit.fill,
                  height: widget.height * 0.19,
                  width: widget.height * 0.19),
          ],
        );
      default:
        return Stack(
          children: [
            if (widget.iconData != null || widget.image != null)
              Container(
                width: widget.height * 0.0875,
                height: widget.height * 0.0875,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Icon(
                  widget.iconData,
                  size: 30,
                ),
              ),
            if (widget.iconData != null || widget.image != null)
              InkWell(
                onTap: () {
                  var pageController =
                      Provider.of<PageViewController>(context, listen: false);
                  pageController.setPage(widget.newScreen);
                },
                child: Image(
                    image: AssetImage(
                        'images/icons/PhoneAnimationIcons/appicon.png'),
                    fit: BoxFit.fill,
                    height: widget.height * 0.0875,
                    width: widget.height * 0.0875),
              ),
            if (widget.iconData == null && widget.image == null)
              Image(
                  image: AssetImage(
                      'images/icons/PhoneAnimationIcons/appicon.png'),
                  fit: BoxFit.fill,
                  height: widget.height * 0.0875,
                  width: widget.height * 0.0875),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: getWidget(),
    );
  }

  @override
  void dispose() {
    isDone = true;
    _controller.dispose();
    super.dispose();
  }
}
