import 'package:flutter/material.dart';
import 'package:website/ColorPalette.dart';
import 'dart:html';

class FullProject extends StatefulWidget {
  int index;
  String text;
  String icon;
  FullProject({required this.index, required this.text, required this.icon});

  @override
  _FullProjectState createState() => _FullProjectState();
}

class _FullProjectState extends State<FullProject> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Stack(
              children: [
                Positioned(
                  left: 30,
                  top: 30,
                  child: Hero(
                    tag: widget.icon,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        width: 200,
                        height: 200,
                        image: AssetImage("images/icons/${widget.icon}.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 15,
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: ColorPalette.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.close,
                          size: 25,
                          color: ColorPalette.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
