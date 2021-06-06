import 'package:flutter/material.dart';
import 'package:website/NavBarItem.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
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
                      color: Color(0xff00A5CF),
                    ),
                  ),
                ),
              ],
            ),
          ),
          NavBarItem(
              title: "About",
              icon: Icons.person,
              themeColor: Color(0xff004E64)),
          NavBarItem(
              title: "Projects",
              icon: Icons.account_tree,
              themeColor: Color(0xff00A5CF)),
          NavBarItem(
              title: "Skills",
              icon: Icons.library_books,
              themeColor: Color(0xff9FFFCB)),
          NavBarItem(
              title: "Education",
              icon: Icons.school,
              themeColor: Color(0xff25A18E)),
          NavBarItem(
              title: "Contact",
              icon: Icons.contact_mail,
              themeColor: Color(0xff7AE582)),
          NavBarItem(
              title: "Resume",
              icon: Icons.description,
              themeColor: Color(0xffC8AD55)),
        ],
      ),
    );
  }
}
