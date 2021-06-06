import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../Header.dart';

class ProjectContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        color: Colors.grey,
        child: Header(title: "Projects", showMenu: false),
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
}
