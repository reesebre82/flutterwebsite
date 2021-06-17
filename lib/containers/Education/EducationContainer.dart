import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:website/containers/Education/EducationTimelineBuilder.dart';

import '../Header.dart';

class EducationContainer extends StatefulWidget {
  EducationContainer({Key? key}) : super(key: key);
  @override
  EducationContainerState createState() => EducationContainerState();
}

class EducationContainerState extends State<EducationContainer> {
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        color: Colors.grey,
        child: Header(title: "Education", showMenu: false),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 100.0),
              child: Container(
                height: 250,
                child: EducationTimelineBuilder(
                  dataStamp: ["etst"],
                  timeStamp: ["test"],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
