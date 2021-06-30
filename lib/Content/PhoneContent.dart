import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/containers/PhoneAnimation/PhoneAnimation.dart';
import 'package:website/controllers/PhoneMenuController.dart';

class PhoneContent extends StatefulWidget {
  const PhoneContent({Key? key}) : super(key: key);

  @override
  PhoneContentState createState() => PhoneContentState();
}

class PhoneContentState extends State<PhoneContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late bool isPhoneOpen = false;

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
    double phoneHeight = 550;
    double phoneWidth = 275;
    double screenWidth = MediaQuery.of(context).size.width;
    context.read<PhoneMenuController>().setPhoneHeight(phoneHeight);
    context.read<PhoneMenuController>().setPhoneWidth(phoneWidth);
    context.read<PhoneMenuController>().setScreenWidth(screenWidth);

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

    return Stack(
      children: [
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
}
