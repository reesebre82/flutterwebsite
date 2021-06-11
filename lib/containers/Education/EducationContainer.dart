import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../Header.dart';

class EducationContainer extends StatelessWidget {
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
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Container(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    TimelineTile(
                      axis: TimelineAxis.horizontal,
                      alignment: TimelineAlign.manual,
                      lineXY: 0.3,
                      isFirst: true,
                      indicatorStyle: const IndicatorStyle(
                        height: 20,
                        color: Colors.black,
                      ),
                      beforeLineStyle: const LineStyle(
                        color: Color(0xff25A18E),
                        thickness: 6,
                      ),
                    ),
                    const TimelineDivider(
                      axis: TimelineAxis.vertical,
                      begin: 0.3,
                      end: 0.7,
                      thickness: 6,
                      color: Color(0xff25A18E),
                    ),
                    Container(
                      width: 300,
                      child: TimelineTile(
                        axis: TimelineAxis.horizontal,
                        alignment: TimelineAlign.manual,
                        lineXY: 0.7,
                        beforeLineStyle: const LineStyle(
                          color: Color(0xff25A18E),
                          thickness: 6,
                        ),
                        afterLineStyle: const LineStyle(
                          color: Color(0xff25A18E),
                          thickness: 6,
                        ),
                        indicatorStyle: const IndicatorStyle(
                          height: 20,
                          color: Colors.deepOrange,
                        ),
                        endChild: Text("testinig"),
                      ),
                    ),
                    const TimelineDivider(
                      axis: TimelineAxis.vertical,
                      begin: 0.3,
                      end: 0.7,
                      thickness: 6,
                      color: Color(0xff25A18E),
                    ),
                    TimelineTile(
                      axis: TimelineAxis.horizontal,
                      alignment: TimelineAlign.manual,
                      lineXY: 0.3,
                      isLast: true,
                      beforeLineStyle: const LineStyle(
                        color: Color(0xff25A18E),
                        thickness: 6,
                      ),
                      indicatorStyle: const IndicatorStyle(
                        height: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
