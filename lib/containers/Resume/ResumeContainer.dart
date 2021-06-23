import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../Header.dart';

class ResumeContainer extends StatefulWidget {
  ResumeContainer({Key? key}) : super(key: key);
  @override
  ResumeContainerState createState() => ResumeContainerState();
}

class ResumeContainerState extends State<ResumeContainer> {
  double getHeight() {
    return MediaQuery.of(context).size.height * 2;
  }

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: 0,
        // color: Colors.grey,
        // child: Header(title: "Resume", showMenu: false),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              height: MediaQuery.of(context).size.height * 2,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image(
                  image: AssetImage('images/Resume_Brendan2.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
