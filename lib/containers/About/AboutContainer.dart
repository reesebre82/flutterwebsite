import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../Footer.dart';
import '../Header.dart';

class AboutContainer extends StatefulWidget {
  AboutContainer({Key? key}) : super(key: key);
  @override
  AboutContainerState createState() => AboutContainerState();
}

class AboutContainerState extends State<AboutContainer> {
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        child: Header(title: "About Me", showMenu: false),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Footer(),
          ],
        ),
      ),
    );
  }
}
