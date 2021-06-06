import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../Header.dart';
import '../../Responsive.dart';
import '../../controllers/MenuController.dart';
import 'package:provider/provider.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return SliverStickyHeader(
        header: Container(
          color: Colors.grey,
        ),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              Image(
                image: AssetImage('images/chalkboard_web.jpg'),
                fit: BoxFit.fill,
              ),
              Image(
                image: AssetImage('images/chalkboard_web.jpg'),
                fit: BoxFit.fill,
              ),
              Image(
                image: AssetImage('images/chalkboard_web.jpg'),
                fit: BoxFit.fill,
              ),
              Image(
                image: AssetImage('images/chalkboard_web.jpg'),
                fit: BoxFit.fill,
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
          [
            Image(
              image: AssetImage('images/chalkboard_web.jpg'),
              fit: BoxFit.fill,
            ),
            Image(
              image: AssetImage('images/chalkboard_web.jpg'),
              fit: BoxFit.fill,
            ),
            Image(
              image: AssetImage('images/chalkboard_web.jpg'),
              fit: BoxFit.fill,
            ),
            Image(
              image: AssetImage('images/chalkboard_web.jpg'),
              fit: BoxFit.fill,
            ),
          ],
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
