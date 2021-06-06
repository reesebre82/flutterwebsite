import 'package:flutter/material.dart';

import 'Header.dart';
import 'Responsive.dart';
import 'controllers/MenuController.dart';
import 'package:provider/provider.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          Header(title: "Brendan Reese"),
          Image(
            image: AssetImage('images/chalkboard_web.jpg'),
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
