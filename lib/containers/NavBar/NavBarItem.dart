import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/controllers/ScrollerController.dart';

class NavBarItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color themeColor;
  final double scrollPosition;

  NavBarItem(
      {required this.title,
      required this.icon,
      required this.themeColor,
      required this.scrollPosition});

  //ADD STATE AND APPROVED EVERYWHERE

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> with TickerProviderStateMixin {
  bool isHovered = false;
  var color = Colors.white;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: Duration(milliseconds: 250), vsync: this)
      ..addListener(() => setState(() {}));
    animation = Tween(begin: 0.0, end: 5.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    final scrollValue = Provider.of<ScrollerController>(context);
    if (isHovered) {
      color = Colors.white;
      controller.forward();
    } else {
      color = Colors.white;
      controller.reverse();
    }
    return Stack(
      children: [
        Container(
          width: 150,
          height: 45,
          color: widget.themeColor,
        ),
        Transform.translate(
          offset: Offset(animation.value, 0.0),
          child: Container(
            height: 45,
            color: color,
            child: InkWell(
              onTap: () {
                scrollValue.scrollTo(widget.scrollPosition);
              },
              onHover: (value) {
                setState(() {
                  isHovered = value;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      widget.icon,
                      color: widget.themeColor,
                    ),
                    Container(width: 15),
                    Text(widget.title),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
