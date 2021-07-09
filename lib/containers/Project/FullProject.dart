import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/containers/Project/ProjectPlayer.dart';
import 'dart:html';

import 'package:website/containers/Project/ScreenshotImage.dart';

class FullProject extends StatefulWidget {
  int index;
  String text;
  String icon;
  String tag;
  String title;
  IconData device;
  int images;
  String? videoURL;
  String? githubURL;
  bool isGif;
  bool isPhone;

  FullProject({
    required this.index,
    required this.text,
    required this.icon,
    required this.tag,
    required this.title,
    required this.device,
    required this.images,
    required this.isGif,
    required this.isPhone,
    this.videoURL,
    this.githubURL,
  });

  @override
  _FullProjectState createState() => _FullProjectState();
}

class _FullProjectState extends State<FullProject> {
  Widget screenshots() {
    List<AssetImage> images = [];
    for (int i = 0; i < widget.images; i++) {
      images.add(getImage(i));
    }

    if (widget.isPhone) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.5,
        child: ListView.builder(
          itemCount: widget.images,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.only(right: 0),
              child: ScreenshotImage(
                image: images[i],
                height: 550,
                width: 250,
              ),
            );
          },
        ),
      );
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        itemCount: widget.images,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Padding(
            padding: EdgeInsets.only(right: 30),
            child: ScreenshotImage(
              image: images[i],
              height: 100,
              width: 600,
            ),
          );
        },
      ),
    );
  }

  AssetImage getImage(int index) {
    if (widget.isGif) {
      return AssetImage("images/${widget.icon}/${index}${widget.icon}.gif");
    }
    return AssetImage("images/${widget.icon}/${index}${widget.icon}.png");
  }

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
                    tag: widget.tag,
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
                Positioned(
                  top: 30,
                  left: 260,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: ColorPalette.mediumTurquise,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Center(
                      child: Icon(
                        widget.device,
                        size: 30,
                        color: ColorPalette.mindaro,
                      ),
                    ),
                  ),
                ),
                if (widget.githubURL != null)
                  Positioned(
                    top: 45,
                    left: 330,
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          launch(widget.githubURL!);
                        },
                        child: Text(
                          widget.githubURL!,
                          style: GoogleFonts.domine(
                            textStyle: TextStyle(fontSize: 16),
                            color: ColorPalette.grey,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: 80,
                  left: 260,
                  child: Text(
                    widget.title,
                    style: GoogleFonts.domine(
                      textStyle: TextStyle(fontSize: 50),
                      color: ColorPalette.grey,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Positioned(
                  top: 140,
                  left: 260,
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.575),
                    child: Text(
                      widget.text,
                      style: GoogleFonts.asap(
                        textStyle: TextStyle(fontSize: 16),
                        color: ColorPalette.grey,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                if (widget.videoURL != null)
                  Positioned(
                    top: 300,
                    left: 280,
                    child: screenshots(),
                  ),
                if (widget.videoURL != null)
                  Positioned(
                    top: 310,
                    left: 50,
                    child: ProjectPlayer(
                      height: 450,
                      width: 200,
                      url: widget.videoURL!,
                    ),
                  ),
                if (widget.videoURL == null)
                  Positioned(
                    top: 300,
                    left: 30,
                    child: screenshots(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
