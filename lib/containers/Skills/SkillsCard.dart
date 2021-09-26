import 'package:flutter/material.dart';

class SkillsCard extends StatelessWidget {
  final String title;
  final List<String> icons;
  final List<String> skill;

  SkillsCard({required this.title, required this.icons, required this.skill});

  @override
  Widget build(BuildContext context) {
    double titleSize = 35;
    double iconSize = 125;
    double widthOffset = 0.6;
    double height = 0.35;
    double titleTopPadding = 25;
    int flex1 = 30;
    int flex2 = 5;
    int flex3 = 65;
    if (MediaQuery.of(context).size.width > 1500) {
      titleSize = 35;
      iconSize = 125;
    } else if (MediaQuery.of(context).size.width > 1400) {
      titleSize = 35;
      iconSize = 125;
    } else if (MediaQuery.of(context).size.width > 1000) {
      titleSize = 35;
      iconSize = 100;
    } else if (MediaQuery.of(context).size.width > 875) {
      titleSize = 25;
      iconSize = 100;
    } else if (MediaQuery.of(context).size.width > 750) {
      titleSize = 25;
      iconSize = 75;
      height = 0.3;
    } else if (MediaQuery.of(context).size.width > 670) {
      titleSize = 25;
      iconSize = 65;
      height = 0.25;
    } else if (MediaQuery.of(context).size.width > 650) {
      titleSize = 25;
      iconSize = 50;
      height = 0.20;
    } else if (MediaQuery.of(context).size.width > 550) {
      titleSize = 25;
      iconSize = 40;
      height = 0.20;
    } else if (MediaQuery.of(context).size.width > 515) {
      titleSize = 20;
      iconSize = 35;
      height = 0.15;
      flex1 = 25;
      flex2 = 1;
      flex3 = 79;
      titleTopPadding = 5;
    } else if (MediaQuery.of(context).size.width > 480) {
      titleSize = 20;
      iconSize = 25;
      height = 0.15;
      flex1 = 25;
      flex2 = 1;
      flex3 = 79;
      titleTopPadding = 5;
    } else {
      titleSize = 20;
      iconSize = 25;
      height = 0.15;
      flex1 = 25;
      flex2 = 1;
      flex3 = 79;
      titleTopPadding = 5;
    }

    if (MediaQuery.of(context).size.width > 1350) {
      widthOffset = 0.6;
    } else if (MediaQuery.of(context).size.width > 1100) {
      widthOffset = 0.75;
    } else {
      widthOffset = 0.9;
    }

    if (MediaQuery.of(context).size.width >= 480 || icons.length < 4)
      return Container(
        height: MediaQuery.of(context).size.height * height,
        width: MediaQuery.of(context).size.width * widthOffset,
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
              flex: flex1,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(top: titleTopPadding, left: 15),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: titleSize),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: flex2,
              child: Divider(
                indent: 16,
                endIndent: 16,
              ),
            ),
            Expanded(
              flex: flex3,
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
                        width: iconSize,
                        height: iconSize,
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
    if (MediaQuery.of(context).size.width > 360)
      return Container(
        height: MediaQuery.of(context).size.height * height * 1.5,
        width: MediaQuery.of(context).size.width * widthOffset,
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
              flex: flex1,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(top: titleTopPadding, left: 15),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: titleSize),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: flex2,
              child: Divider(
                indent: 16,
                endIndent: 16,
              ),
            ),
            Expanded(
              flex: (flex3 / 2).round(),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 10.0),
                      child: Image(
                        image: AssetImage(icons[index]),
                        width: iconSize,
                        height: iconSize,
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
            Expanded(
              flex: (flex3 / 2).round(),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 10.0),
                      child: Image(
                        image: AssetImage(icons[index + 4]),
                        width: iconSize,
                        height: iconSize,
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
    return Container(
      height: MediaQuery.of(context).size.height * height * 1.5,
      width: MediaQuery.of(context).size.width * widthOffset,
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
            flex: flex1,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(top: titleTopPadding, left: 15),
                child: Text(
                  title,
                  style: TextStyle(fontSize: titleSize),
                ),
              ),
            ),
          ),
          Expanded(
            flex: flex2,
            child: Divider(
              indent: 16,
              endIndent: 16,
            ),
          ),
          Expanded(
            flex: (flex3 / 2).round(),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 10.0),
                    child: Image(
                      image: AssetImage(icons[index]),
                      width: iconSize,
                      height: iconSize,
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
          Expanded(
            flex: (flex3 / 2).round(),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 10.0),
                    child: Image(
                      image: AssetImage(icons[index + 3]),
                      width: iconSize,
                      height: iconSize,
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
