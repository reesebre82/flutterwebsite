import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import '../Header.dart';
import 'ContactSection.dart';

class ContactContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        color: Colors.grey,
        child: Header(title: "Contact Me", showMenu: false),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ContactSection(
                      title: "Github",
                      dataTitle: ["GitHub Link: \nReesebre82"],
                      data: ["https://github.com/reesebre82/"],
                      icon: Foundation.social_github,
                      isLink: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ContactSection(
                      title: "Email",
                      dataTitle: ["Preferred Email:", "Alternate: "],
                      data: [
                        "brendan@brendanreese.com",
                        "reesebre82@gmail.com"
                      ],
                      icon: Foundation.mail,
                      isLink: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ContactSection(
                      title: "Phone Number",
                      dataTitle: ["Mobile:"],
                      data: ["1(512)900-0702"],
                      icon: Foundation.mail,
                      isLink: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
