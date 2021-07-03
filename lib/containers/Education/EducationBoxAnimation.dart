import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';

import 'package:website/controllers/PageViewController.dart';

class EducationBoxAnimation extends StatefulWidget {
  double centerOffset;
  double width;
  double height;
  bool animated = false;
  //Text Later on
  String title;
  String text;
  String date;
  String? subTitle;

  EducationBoxAnimation({
    required this.centerOffset,
    required this.width,
    required this.height,
    required this.title,
    required this.text,
    required this.date,
    this.subTitle,
  });

  @override
  EducationBoxAnimationState createState() => EducationBoxAnimationState();
}

class EducationBoxAnimationState extends State<EducationBoxAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _opacityController;
  late Animation animation;
  late Animation opacityAnimation;

  late double scrollOffset;
  late double screenHeight;
  late double screenWidth;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: Duration(milliseconds: 500), vsync: this)
      ..addListener(() => setState(() {}));
    _opacityController = new AnimationController(
        duration: Duration(milliseconds: 500), vsync: this)
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _opacityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    scrollOffset = context.read<PageViewController>().scrollPosition;
    double startLocation = 0.0;
    double endLocation = 0.0;

    endLocation = (screenWidth / 2) + widget.centerOffset - (widget.width / 2);
    startLocation = endLocation - 300;

    animation = Tween(begin: startLocation, end: endLocation)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _opacityController, curve: Curves.easeOut));
    _opacityController.forward();

    return Transform.translate(
      offset: Offset(animation.value, 0),
      child: Opacity(
        opacity: opacityAnimation.value,
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: ColorPalette.mindaro,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.domine(
                        textStyle: TextStyle(fontSize: 17),
                      ),
                    ),
                    Spacer(),
                    Text(
                      widget.date,
                      style: GoogleFonts.domine(
                        textStyle: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.subTitle != null)
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    widget.subTitle!,
                    style: GoogleFonts.domine(
                      textStyle: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.text,
                  style: GoogleFonts.domine(
                    textStyle: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
