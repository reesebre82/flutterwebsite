import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/controllers/PhoneMenuController.dart';

import '../Responsive.dart';
import '../controllers/MenuController.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  final String title;
  final bool showMenu;

  Header({required this.title, required this.showMenu});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> with TickerProviderStateMixin {
  // late AnimationController controller;
  // late Animation<double> animation;

  double offset = 0;

  @override
  void initState() {
    super.initState();
    // controller =
    //     new AnimationController(duration: Duration(seconds: 1), vsync: this)
    //       ..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    // final curvedAnimation = CurvedAnimation(
    //   parent: controller,
    //   curve: Curves.easeIn,
    // );
    // animation = Tween(begin: MediaQuery.of(context).size.width, end: 0.0)
    // .animate(curvedAnimation);
    // controller.forward();
    double _height = 50;
    double _iconSize = 24;
    double _fontSize = 30;
    if (Responsive.isTablet(context)) {
      _height = 45;
      _iconSize = 24;
      _fontSize = 24;
    }
    if (Responsive.isMobile(context)) {
      _height = 45;
      _iconSize = 22;
      _fontSize = 20;
    }

    if (Responsive.isDesktop(context)) {
      offset = context.read<PhoneMenuController>().getPhoneMenuOffset();
    }

    return Container(
      height: _height,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0 + offset),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(fontSize: _fontSize),
                ),
              ),
            ),
          ),
          //SECTION-- USED FOR ANIMATION TO MOVE ACROSS RIGHT TO LEFT
          // Padding(
          //   padding: const EdgeInsets.only(left: 15.0),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Transform.translate(
          //       offset: Offset(animation.value, 0.0),
          //       child: Text(
          //         widget.title,
          //         style: GoogleFonts.raleway(
          //           textStyle: TextStyle(fontSize: _fontSize),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          //-----END SECTION
          //SECTION-- USED FOR THE WAY HEADERS FUNCTION IN MOBILE
          // if (!Responsive.isDesktop(context) && showMenu)
          //   Align(
          //     alignment: Alignment.centerLeft,
          //     child: IconButton(
          //       icon: Icon(
          //         Icons.menu,
          //         size: _iconSize,
          //       ),
          //       onPressed: context.read<MenuController>().controlMenu,
          //     ),
          //   ),
          //-----END SECTON
        ],
      ),
    );
  }
}
