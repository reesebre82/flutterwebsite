import 'package:flutter/material.dart';
import 'package:website/ColorPalette.dart';

class ProjectIcon extends StatelessWidget {
  String icon;
  String title;
  String description;
  IconData device;
  double width;

  ProjectIcon({
    Key? key,
    required this.icon,
    required this.description,
    required this.title,
    required this.device,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double titleText = 24;
    double bodyText = 16;

    if (MediaQuery.of(context).size.width < 1000) {
      titleText = 22;
      bodyText = 14;
    }
    if (MediaQuery.of(context).size.width < 550) {
      titleText = 20;
      bodyText = 12;
    }

    return Stack(
      children: [
        Container(
          width: width,
          height: width / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: ColorPalette.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 7,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  width: (width / 3) - 20,
                  child: Hero(
                    tag: icon,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        width: (width / 3) - 20,
                        height: (width / 3) - 20,
                        image: AssetImage("images/icons/${icon}.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  constraints: BoxConstraints(maxWidth: width * 0.62),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontSize: titleText, color: ColorPalette.grey)),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(description,
                            style: TextStyle(
                                fontSize: bodyText, color: ColorPalette.grey)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: ColorPalette.mediumTurquise,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              device,
              color: ColorPalette.mindaro,
            ),
          ),
        ),
      ],
    );
  }
}
