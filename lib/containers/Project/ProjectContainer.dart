import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:website/containers/Project/Swift/SwiftCarousel.dart';

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
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SwiftCarousel(),
                ),
                Expanded(
                  flex: 3,
                  child: SwiftCarousel(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
