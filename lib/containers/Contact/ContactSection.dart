import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/ColorPalette.dart';

class ContactSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> dataTitle;
  final List<String> data;
  final bool isLink;

  ContactSection(
      {required this.icon,
      required this.title,
      required this.dataTitle,
      required this.data,
      required this.isLink});

  @override
  Widget build(BuildContext context) {
    final List<String> combinedData = [];
    for (var i = 0; i < dataTitle.length; i++) {
      combinedData.add(dataTitle[i]);
      combinedData.add(data[i]);
    }
    if (isLink)
      return Container(
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: ColorPalette.mindaro,
              ),
              child: Icon(
                icon,
                size: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 24, color: ColorPalette.grey),
              ),
            ),
            for (var i = 0; i < dataTitle.length; i++)
              RichText(
                text: TextSpan(
                  text: dataTitle[i],
                  style: new TextStyle(color: Colors.blue),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      launch(data[i]);
                    },
                ),
              ),
          ],
        ),
      );

    return Container(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: ColorPalette.mindaro,
            ),
            child: Icon(
              icon,
              size: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 24, color: ColorPalette.grey),
            ),
          ),
          for (var i = 0; i < combinedData.length; i++)
            Text(
              combinedData[i],
              style: TextStyle(color: ColorPalette.grey),
            ),
        ],
      ),
    );
  }
}
