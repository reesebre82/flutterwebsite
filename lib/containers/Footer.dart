import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Text(
        "test",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
