import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SwiftCarousel extends StatefulWidget {
  const SwiftCarousel({Key? key}) : super(key: key);

  @override
  _SwiftCarouselState createState() => _SwiftCarouselState();
}

class _SwiftCarouselState extends State<SwiftCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
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
          width: 200.0,
          color: Colors.red,
        ),
        Container(
          width: 200.0,
          color: Colors.blue,
        ),
        Container(
          width: 200.0,
          color: Colors.green,
        ),
      ],
    );
  }
}
