import 'package:flutter/material.dart';

import 'Responsive.dart';
import 'controllers/MenuController.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  final String title;

  Header({required this.title});

  @override
  Widget build(BuildContext context) {
    double _height = 50;
    double _iconSize = 24;
    double _fontSize = 30;
    if (Responsive.isTablet(context)) {
      _height = 40;
      _iconSize = 24;
      _fontSize = 24;
    }
    if (Responsive.isMobile(context)) {
      _height = 30;
      _iconSize = 18;
      _fontSize = 20;
    }

    return Container(
      height: _height,
      child: Stack(
        children: [
          Align(
            child: Text(
              title,
              style: TextStyle(fontSize: _fontSize),
            ),
          ),
          if (!Responsive.isDesktop(context))
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: _iconSize,
                ),
                onPressed: context.read<MenuController>().controlMenu,
              ),
            ),
        ],
      ),
    );
  }
}

// child: Stack(
//     children: [
//       Align(child: Text('Center')),
//       Positioned(right: 0, child: Text('#')),
//     ],
//   ),
