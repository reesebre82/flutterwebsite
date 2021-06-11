import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class EducationTimelineNode {
  final String date;
  final String notes;
  final double startingValue;
  final double endingValue;
  final bool isFirst;
  final bool isLast;
  final int index;

  EducationTimelineNode({
    required this.date,
    required this.notes,
    required this.startingValue,
    required this.endingValue,
    required this.isFirst,
    required this.isLast,
    required this.index,
  });

  List<Widget> getList() {
    List<Widget> returnList = [];
    if (isFirst) addToList(getFirst(), returnList);
    addToList(getNode((index % 2 == 0)), returnList);
    if (isLast) addToList(getLast((index % 2 == 0)), returnList);

    return returnList;
  }

  List<Widget> getFirst() {
    return [
      TimelineTile(
        axis: TimelineAxis.horizontal,
        alignment: TimelineAlign.manual,
        lineXY: startingValue,
        isFirst: isFirst,
        indicatorStyle: const IndicatorStyle(
          height: 20,
          color: Colors.black,
        ),
        beforeLineStyle: const LineStyle(
          color: Color(0xff25A18E),
          thickness: 6,
        ),
      ),
      TimelineDivider(
        axis: TimelineAxis.vertical,
        begin: startingValue,
        end: endingValue,
        thickness: 6,
        color: Color(0xff25A18E),
      ),
    ];
  }

  List<Widget> getLast(isTop) {
    if (isTop)
      return [
        TimelineTile(
          axis: TimelineAxis.horizontal,
          alignment: TimelineAlign.manual,
          lineXY: endingValue,
          isLast: isLast,
          beforeLineStyle: const LineStyle(
            color: Color(0xff25A18E),
            thickness: 6,
          ),
          indicatorStyle: const IndicatorStyle(
            height: 20,
            color: Colors.black,
          ),
        ),
      ];
    return [
      TimelineTile(
        axis: TimelineAxis.horizontal,
        alignment: TimelineAlign.manual,
        lineXY: startingValue,
        isLast: isLast,
        beforeLineStyle: const LineStyle(
          color: Color(0xff25A18E),
          thickness: 6,
        ),
        indicatorStyle: const IndicatorStyle(
          height: 20,
          color: Colors.black,
        ),
      ),
    ];
  }

  List<Widget> getNode(isTop) {
    //IS Top
    if (isTop)
      return [
        Container(
          width: 300,
          child: TimelineTile(
            axis: TimelineAxis.horizontal,
            alignment: TimelineAlign.manual,
            lineXY: startingValue,
            isFirst: false,
            indicatorStyle: const IndicatorStyle(
              height: 20,
              color: Colors.black,
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xff25A18E),
              thickness: 6,
            ),
            endChild: Text(date),
            startChild: Text(
              notes,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        TimelineDivider(
          axis: TimelineAxis.vertical,
          begin: startingValue,
          end: endingValue,
          thickness: 6,
          color: Color(0xff25A18E),
        ),
      ];
    //IS Bottom
    return [
      Container(
        width: 300,
        child: TimelineTile(
          axis: TimelineAxis.horizontal,
          alignment: TimelineAlign.manual,
          lineXY: endingValue,
          isLast: false,
          beforeLineStyle: const LineStyle(
            color: Color(0xff25A18E),
            thickness: 6,
          ),
          indicatorStyle: const IndicatorStyle(
            height: 20,
            color: Colors.black,
          ),
          endChild: Text(
            notes,
            textAlign: TextAlign.center,
          ),
          startChild: Padding(
            padding: const EdgeInsets.only(top: 198.0),
            child: Text(date),
          ),
        ),
      ),
      TimelineDivider(
        axis: TimelineAxis.vertical,
        begin: startingValue,
        end: endingValue,
        thickness: 6,
        color: Color(0xff25A18E),
      ),
    ];
  }

  addToList(List<Widget> widgetList, List<Widget> list) {
    for (var i = 0; i < widgetList.length; i++) {
      list.add(widgetList[i]);
    }
  }
}
