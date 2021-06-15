import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/containers/NavBar/NavBarItem.dart';
import 'package:website/controllers/PageViewController.dart';

import '../../Responsive.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final pageViewController = Provider.of<PageViewController>(context);

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Brendan Reese",
                    style: TextStyle(
                      fontSize: 17.5,
                      color: Color(0xff004E64),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Software Developer",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff004E64),
                    ),
                  ),
                ),
              ],
            ),
          ),
          NavBarItem(
            title: "About",
            icon: Icons.person,
            themeColor: Color(0xff004E64),
            page: pageViewController.about(),
          ),
          NavBarItem(
            title: "Projects",
            icon: Icons.account_tree,
            themeColor: Color(0xff00A5CF),
            page: pageViewController.project(),
          ),
          NavBarItem(
            title: "Skills",
            icon: Icons.library_books,
            themeColor: Color(0xff06BCC1),
            page: pageViewController.skills(),
          ),
          NavBarItem(
            title: "Education",
            icon: Icons.school,
            themeColor: Color(0xff06BCC1),
            page: pageViewController.education(),
          ),
          NavBarItem(
            title: "Contact",
            icon: Icons.contact_mail,
            themeColor: Color(0xff25A18E),
            page: pageViewController.contact(),
          ),
          NavBarItem(
            title: "Resume",
            icon: Icons.description,
            themeColor: Color(0xff7AE582),
            page: pageViewController.resume(),
          ),
        ],
      ),
    );
  }
}

//Colors
// Color(0xff004E64)
// Color(0xff00A5CF)
// Color(0xff06BCC1)
// Color(0xff25A18E)
// Color(0xff7AE582)
// Color(0xffC8AD55)
