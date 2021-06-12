import 'package:flutter/material.dart';
import 'package:website/containers/Skills/LinearSkillBar.dart';

class DoubleLinearSkillBar extends StatelessWidget {
  final List<String> titles;
  final List<double> values;

  DoubleLinearSkillBar({required this.titles, required this.values});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: LinearSkillBar(value: values[0], title: titles[0]),
        ),
        Spacer(flex: 1),
        Expanded(
          flex: 5,
          child: LinearSkillBar(value: values[1], title: titles[1]),
        ),
      ],
    );
  }
}
