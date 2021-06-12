import 'package:flutter/material.dart';

class LinearSkillBar extends StatelessWidget {
  final double value;
  final String title;

  LinearSkillBar({required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    var percentOffset = 0;
    if (value >= .25) percentOffset = 1;
    if (value >= .50) percentOffset = 2;
    if (value >= .75) percentOffset = 3;
    if (value >= 1.00) percentOffset = 4;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: (value * 1000).round() - 10,
                child: Text(title),
              ),
              Expanded(
                flex: 1000 - (value * 1000).round() + 10,
                child: Text("${value * 100}%"),
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 15,
              color: Color(0xff06BCC1),
              semanticsLabel: 'Linear progress indicator',
            ),
          ),
        ],
      ),
    );
  }
}
