import 'package:flutter/material.dart';
import 'package:website/ColorPalette.dart';

class ProjectIcon extends StatelessWidget {
  String icon;
  String title;
  String description;

  ProjectIcon({
    Key? key,
    required this.icon,
    required this.description,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 150,
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
              width: 130,
              child: Hero(
                tag: icon,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    width: 130,
                    height: 130,
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
              constraints: BoxConstraints(maxWidth: 275),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(fontSize: 24, color: ColorPalette.grey)),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(description,
                        style:
                            TextStyle(fontSize: 16, color: ColorPalette.grey)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
