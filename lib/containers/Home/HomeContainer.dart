import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';
import 'package:website/containers/PhoneAnimation/PhoneAnimation.dart';
import 'package:website/controllers/PageViewController.dart';

import '../Header.dart';
import '../../Responsive.dart';

class HomeContainer extends StatefulWidget {
  HomeContainer({Key? key}) : super(key: key);
  @override
  HomeContainerState createState() => HomeContainerState();
}

class HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    if (Responsive.isDesktop(context)) {
      return SliverStickyHeader(
        header: Container(
          color: Colors.grey,
        ),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: screenHeight * 1.5,
              ),
            ],
          ),
        ),
      );
    }
    return SliverStickyHeader(
      header: Container(
        color: Colors.grey,
        child: Header(
            title: "Brendan Reese, Software Development", showMenu: true),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     color: Colors.grey,
  //     child: Column(
  //       children: [
  //         if (!Responsive.isDesktop(context))
  //           Header(
  //             title: "Brendan Reese",
  //             showMenu: true,
  //           ),
  //         Image(
  //           image: AssetImage('images/chalkboard_web.jpg'),
  //           fit: BoxFit.fill,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
