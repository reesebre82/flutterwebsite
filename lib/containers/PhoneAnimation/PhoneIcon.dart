import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/controllers/PageViewController.dart';
import 'package:website/controllers/PhoneMenuController.dart';

class PhoneIcon extends StatefulWidget {
  int icon;
  double height;
  String? image;
  IconData? iconData;
  int? newScreen;
  String? title;
  Color color;
  PhoneIcon(
      {required this.icon,
      required this.height,
      required this.color,
      this.iconData,
      this.image,
      this.newScreen,
      this.title});

  @override
  _PhoneIconState createState() => _PhoneIconState();
}

class _PhoneIconState extends State<PhoneIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> animation;
  late bool shouldAnimate;
  late int durationLength;

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

  Widget getWidget() {
    switch (widget.icon) {
      case 0:
        return Stack(
          children: [
            if (widget.iconData != null || widget.image != null)
              Container(
                width: widget.height * 0.0875,
                child: Column(
                  children: [
                    Container(
                      width: widget.height * 0.0875,
                      height: widget.height * 0.0875,
                      decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Icon(
                        widget.iconData,
                        size: 30,
                      ),
                    ),
                    Text(
                      widget.title!,
                      style: GoogleFonts.asap(
                        textStyle: TextStyle(fontSize: 9),
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            if (widget.iconData != null || widget.image != null)
              InkWell(
                onTap: () {
                  var phoneController =
                      Provider.of<PhoneMenuController>(context, listen: false);
                  if (phoneController.toggled) {
                    phoneController.toggle();
                  }
                  var pageController =
                      Provider.of<PageViewController>(context, listen: false);
                  pageController.setPage(widget.newScreen!);
                },
                child: Container(
                  width: widget.height * 0.08785,
                  height: widget.height * 0.08785,
                  // decoration: BoxDecoration(
                  //   border: Border.all(width: 4.0),
                  //   borderRadius: BorderRadius.circular(12.0),
                  // ),
                ),
              ),
            if (widget.iconData == null && widget.image == null)
              Container(
                width: widget.height * 0.08785,
                height: widget.height * 0.08785,
                decoration: BoxDecoration(
                  // border: Border.all(width: 4.0),
                  borderRadius: BorderRadius.circular(12.0),
                  color: widget.color,
                ),
              ),
          ],
        );
      case 1:
        return Stack(
          children: [
            Container(
              width: widget.height * 0.08785,
              height: widget.height * 0.08785,
              decoration: BoxDecoration(
                //  border: Border.all(width: 4.0),
                borderRadius: BorderRadius.circular(12.0),
                color: widget.color,
              ),
            ),
          ],
        );
      case 2:
        return Stack(
          children: [
            if (widget.iconData != null || widget.image != null)
              Container(
                width: widget.height * 0.19,
                child: Column(
                  children: [
                    Container(
                      width: widget.height * 0.19,
                      height: widget.height * 0.19,
                      decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Icon(
                        widget.iconData,
                        size: 40,
                      ),
                    ),
                    Text(
                      widget.title!,
                      style: GoogleFonts.asap(
                        textStyle: TextStyle(fontSize: 15),
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            if (widget.iconData != null || widget.image != null)
              InkWell(
                onTap: () {
                  var phoneController =
                      Provider.of<PhoneMenuController>(context, listen: false);
                  if (phoneController.toggled) {
                    phoneController.toggle();
                  }
                  var pageController =
                      Provider.of<PageViewController>(context, listen: false);
                  pageController.setPage(widget.newScreen!);
                },
                child: Container(
                  width: widget.height * 0.19,
                  height: widget.height * 0.19,
                  decoration: BoxDecoration(
                    // border: Border.all(width: 6.0),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            if (widget.iconData == null && widget.image == null)
              Container(
                width: widget.height * 0.19,
                height: widget.height * 0.19,
                decoration: BoxDecoration(
                  // border: Border.all(width: 6.0),
                  borderRadius: BorderRadius.circular(18.0),
                  color: widget.color,
                ),
              ),
          ],
        );
      case 3:
        return Stack(
          children: [
            Container(
              width: widget.height * 0.19,
              height: widget.height * 0.19,
              decoration: BoxDecoration(
                // border: Border.all(width: 6.0),
                borderRadius: BorderRadius.circular(18.0),
                color: widget.color,
              ),
            ),
          ],
        );
      case 4:
        return Stack(
          children: [
            Container(
              width: widget.height * 0.19,
              height: widget.height * 0.19,
              decoration: BoxDecoration(
                // border: Border.all(width: 6.0),
                borderRadius: BorderRadius.circular(18.0),
                color: widget.color,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage("images/icons/swift.png"),
                          width: widget.height * 0.19 / 5,
                          height: widget.height * 0.19 / 5,
                        ),
                        Image(
                          image: AssetImage("images/icons/c++.png"),
                          width: widget.height * 0.19 / 5,
                          height: widget.height * 0.19 / 5,
                        ),
                        Image(
                          image: AssetImage("images/icons/java.png"),
                          width: widget.height * 0.19 / 5,
                          height: widget.height * 0.19 / 5,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage("images/icons/html.png"),
                          width: widget.height * 0.19 / 5,
                          height: widget.height * 0.19 / 5,
                        ),
                        Image(
                          image: AssetImage("images/icons/css.png"),
                          width: widget.height * 0.19 / 5,
                          height: widget.height * 0.19 / 5,
                        ),
                        Image(
                          image: AssetImage("images/icons/js.png"),
                          width: widget.height * 0.19 / 5,
                          height: widget.height * 0.19 / 5,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage("images/icons/flutter.png"),
                          width: widget.height * 0.19 / 5,
                          height: widget.height * 0.19 / 5,
                        ),
                        Image(
                          image: AssetImage("images/icons/firebase.png"),
                          width: widget.height * 0.19 / 5,
                          height: widget.height * 0.19 / 5,
                        ),
                        Image(
                          image: AssetImage("images/icons/xcode.png"),
                          width: widget.height * 0.19 / 5,
                          height: widget.height * 0.19 / 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                var phoneController =
                    Provider.of<PhoneMenuController>(context, listen: false);
                if (phoneController.toggled) {
                  phoneController.toggle();
                }
                var pageController =
                    Provider.of<PageViewController>(context, listen: false);
                pageController.setPage(widget.newScreen!);
              },
              child: Container(
                width: widget.height * 0.19,
                height: widget.height * 0.19,
                decoration: BoxDecoration(
                  // border: Border.all(width: 6.0),
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ],
        );
      case 5:
        return Stack(
          children: [
            Container(
              width: widget.height * 0.0875,
              child: Column(
                children: [
                  Container(
                    width: widget.height * 0.0875,
                    height: widget.height * 0.0875,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Hero(
                      tag: 'phone-${widget.image}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          width: widget.height * 0.0875,
                          height: widget.height * 0.0875,
                          image: AssetImage("images/icons/${widget.image}.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget.title!,
                    style: GoogleFonts.asap(
                      textStyle: TextStyle(fontSize: 9),
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        );
      default:
        return Stack(
          children: [
            if (widget.iconData != null || widget.image != null)
              Container(
                width: widget.height * 0.0875,
                child: Column(
                  children: [
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
                    Text(
                      widget.title!,
                      style: GoogleFonts.asap(
                        textStyle: TextStyle(fontSize: 10),
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            if (widget.iconData != null || widget.image != null)
              InkWell(
                onTap: () {
                  var phoneController =
                      Provider.of<PhoneMenuController>(context, listen: false);
                  if (phoneController.toggled) {
                    phoneController.toggle();
                  }
                  var pageController =
                      Provider.of<PageViewController>(context, listen: false);
                  pageController.setPage(widget.newScreen!);
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
    _controller.dispose();
    super.dispose();
  }
}
