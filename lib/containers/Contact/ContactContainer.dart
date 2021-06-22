import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/ColorPallette.dart';
import '../Header.dart';
import 'ContactSection.dart';

class ContactContainer extends StatefulWidget {
  ContactContainer({Key? key}) : super(key: key);

  @override
  ContactContainerState createState() => ContactContainerState();
}

class ContactContainerState extends State<ContactContainer> {
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: 0,
        // color: Colors.grey,
        // child: Header(title: "Contact Me", showMenu: false),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorPallette.getTheme(0),
                    ColorPallette.ceruleanBlue
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: Text(
                        "Contact Me",
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              color: ColorPallette.ceruleanBlue,
              child: Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100.0),
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
          ],
        ),
      ),
    );
  }
}
