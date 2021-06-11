import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:website/containers/Education/EducationTimelineNode.dart';

class EducationTimelineBuilder extends StatelessWidget {
  final List<String> timeStamp;
  final List<String> dataStamp;

  EducationTimelineBuilder({required this.dataStamp, required this.timeStamp});

  EducationTimelineNode etn = EducationTimelineNode(
    date: "2011",
    notes: "Started Developing Basic iOS Applications for Personal Use",
    startingValue: 0.2,
    endingValue: 0.8,
    isFirst: true,
    isLast: false,
    index: 1,
  );

  EducationTimelineNode etn2 = EducationTimelineNode(
    date: "2015",
    notes: "Started Deploying Advanced iOS Applications on App Stores",
    startingValue: 0.2,
    endingValue: 0.8,
    isFirst: false,
    isLast: false,
    index: 2,
  );

  EducationTimelineNode etn3 = EducationTimelineNode(
    date: "2016",
    notes: "Graduated High School",
    startingValue: 0.2,
    endingValue: 0.8,
    isFirst: false,
    isLast: false,
    index: 3,
  );

  EducationTimelineNode etn4 = EducationTimelineNode(
    date: "2020",
    notes: "Graduated College With Bachelors of Science in Computer Science",
    startingValue: 0.2,
    endingValue: 0.8,
    isFirst: false,
    isLast: true,
    index: 4,
  );

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    addToList(etn.getList(), list);
    addToList(etn2.getList(), list);
    addToList(etn3.getList(), list);
    addToList(etn4.getList(), list);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return list[index];
      },
      itemCount: list.length,
    );
  }

  addToList(List<Widget> widgetList, List<Widget> list) {
    for (var i = 0; i < widgetList.length; i++) {
      list.add(widgetList[i]);
    }
  }
}
