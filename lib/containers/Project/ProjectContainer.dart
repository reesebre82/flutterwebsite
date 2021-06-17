import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:website/containers/Project/ProjectCarousel.dart';

import '../Header.dart';

class ProjectContainer extends StatefulWidget {
  ProjectContainer({Key? key}) : super(key: key);
  @override
  ProjectContainerState createState() => ProjectContainerState();
}

class ProjectContainerState extends State<ProjectContainer> {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text("TEST"),
                  ),
                  Expanded(
                    flex: 4,
                    child: ProjectCarousel(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
