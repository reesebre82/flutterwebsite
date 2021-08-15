import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:website/ColorPalette.dart';
import 'package:website/Responsive.dart';
import 'package:website/containers/Contact/ContactForm.dart';
import 'package:website/controllers/PageViewController.dart';
import '../Header.dart';
import 'ContactSection.dart';

class ContactContainer extends StatefulWidget {
  ContactContainer({Key? key}) : super(key: key);

  @override
  ContactContainerState createState() => ContactContainerState();
}

class ContactContainerState extends State<ContactContainer> {
  double getHeight() {
    return MediaQuery.of(context).size.height * 1.25;
  }

  double getHeader() {
    if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
      return MediaQuery.of(context).size.height * 0.25;
    }
    return MediaQuery.of(context).size.height * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    var pageViewController = Provider.of<PageViewController>(context);

    double offset =
        pageViewController.getMovingOffset(5, getHeader(), getHeight());

    double titleSize = 350;

    if (MediaQuery.of(context).size.width > 1500) {
      titleSize = 350;
    } else if (MediaQuery.of(context).size.width > 1400) {
      titleSize = 275;
    } else if (MediaQuery.of(context).size.width > 1000) {
      titleSize = 200;
    } else if (MediaQuery.of(context).size.width > 550) {
      titleSize = 115;
    } else {
      titleSize = 75;
    }

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
              height: getHeight(),
              color: ColorPalette.white,
              child: Stack(
                children: [
                  Transform.translate(
                    offset: Offset(0, offset),
                    child: Container(
                      height: getHeader(),
                      child: Center(
                        child: Text(
                          "Contact",
                          style: TextStyle(
                            fontSize: titleSize,
                            color: ColorPalette.lightGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 380,
                    child: ContactForm(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Positioned(
                    top: 420,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: ContactSection(
                                    title: "Github",
                                    dataTitle: ["GitHub Link: \nReesebre82"],
                                    data: ["https://github.com/reesebre82/"],
                                    icon: Foundation.social_github,
                                    isLink: true,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: ContactSection(
                                    title: "Email",
                                    dataTitle: [
                                      "Preferred Email:",
                                      "Alternate: "
                                    ],
                                    data: [
                                      "brendan@brendanreese.com",
                                      "reesebre82@gmail.com"
                                    ],
                                    icon: Foundation.mail,
                                    isLink: false,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: ContactSection(
                                    title: "Phone Number",
                                    dataTitle: ["Mobile:"],
                                    data: ["1 (512) 900-0702"],
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
