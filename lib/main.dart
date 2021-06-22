import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/Content.dart';
import 'package:website/Responsive.dart';
import 'package:website/controllers/EducationAnimationController.dart';
import 'package:website/controllers/MenuController.dart';

import 'package:website/containers/NavBar/NavBar.dart';
import 'package:website/controllers/PageViewController.dart';

import 'controllers/AboutAnimationController.dart';
import 'controllers/PhoneMenuController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brendan Reese',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
          ChangeNotifierProvider(
            create: (context) => PageViewController(),
          ),
          ChangeNotifierProvider(
            create: (context) => PhoneMenuController(),
          ),
          ChangeNotifierProvider(
            create: (context) => AboutAnimationController(),
          ),
          ChangeNotifierProvider(
            create: (context) => EducationAnimationController(),
          ),
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!Responsive.isDesktop(context)) {
      return Scaffold(
        key: context.read<MenuController>().scaffoldKey,
        drawer: NavBar(),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width - 60,
            bottom: MediaQuery.of(context).size.height - 60,
          ),
          child: IconButton(
            icon: Icon(
              Icons.menu,
              size: 24,
            ),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(flex: 1, child: NavBar()),
            Expanded(
              flex: 5,
              child: Content(),
            )
          ],
        ),
      );
    }
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Content(
              key: context.read<PhoneMenuController>().phoneMenuKey,
            ),
          )
        ],
      ),
    );
  }
}
