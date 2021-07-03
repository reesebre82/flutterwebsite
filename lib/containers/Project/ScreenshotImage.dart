import 'package:flutter/material.dart';

class ScreenshotImage extends StatelessWidget {
  AssetImage image;
  double height;
  double width;
  ScreenshotImage(
      {required this.image, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Image(
      height: height,
      width: width,
      image: image,
      fit: BoxFit.fill,
    );
  }
}
