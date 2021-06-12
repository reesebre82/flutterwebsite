import 'package:flutter/material.dart';

class SkillsCard extends StatelessWidget {
  final String title;
  final List<String> icons;
  final List<String> skill;

  SkillsCard({required this.title, required this.icons, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 30,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 15),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Divider(
              indent: 16,
              endIndent: 16,
            ),
          ),
          Expanded(
            flex: 65,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: icons.length,
              itemBuilder: (BuildContext context, int index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 10.0),
                    child: Image(
                      image: AssetImage(icons[index]),
                      width: 125,
                      height: 125,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      skill[index],
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
