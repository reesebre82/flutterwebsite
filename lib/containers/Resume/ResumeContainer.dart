import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../Header.dart';

class ResumeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        color: Colors.grey,
        child: Header(title: "Resume", showMenu: false),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image(
                image: AssetImage('images/Resume_Brendan2.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
