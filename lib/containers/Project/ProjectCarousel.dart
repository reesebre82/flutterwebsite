import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProjectCarousel extends StatefulWidget {
  const ProjectCarousel({Key? key}) : super(key: key);

  @override
  _ProjectCarouselState createState() => _ProjectCarouselState();
}

class _ProjectCarouselState extends State<ProjectCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Recent Projects",
            style: TextStyle(fontSize: 30),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 6),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: [
            Container(
              width: 400.0,
              color: Colors.red,
            ),
            Container(
              width: 400.0,
              color: Colors.blue,
            ),
            Container(
              width: 400.0,
              color: Colors.green,
            ),
          ],
        ),
      ],
    );
  }
}
