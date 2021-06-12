import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../Header.dart';
import '../../Responsive.dart';
import '../../controllers/MenuController.dart';
import 'package:provider/provider.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return SliverStickyHeader(
        header: Container(
          color: Colors.grey,
        ),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('  1    '),
                                  AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        "class BrendanReese extends SoftwareDeveloper {",
                                        speed: const Duration(milliseconds: 50),
                                      )
                                    ],
                                    totalRepeatCount: 1,
                                  )
                                ],
                              ),
                              Text('  2    '),
                              Text('  3    '),
                              Text('  4    '),
                              Text('  5    '),
                              Text('  6    '),
                              Text('  7    '),
                              Text('  8    '),
                              Text('  9    '),
                              Text('10     '),
                              Text('11     '),
                              Text('12     '),
                              Text('13     '),
                              Text('14     '),
                              Text('15     '),
                              Text('16     '),
                              Text('17     '),
                              Text('18     '),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.25,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image(
                        image: AssetImage('images/headshot.png'),
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    return SliverStickyHeader(
      header: Container(
        color: Colors.grey,
        child: Header(
            title: "Brendan Reese, Software Development", showMenu: true),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Image(
                    image: AssetImage('images/headshot.png'),
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height - 45,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     color: Colors.grey,
  //     child: Column(
  //       children: [
  //         if (!Responsive.isDesktop(context))
  //           Header(
  //             title: "Brendan Reese",
  //             showMenu: true,
  //           ),
  //         Image(
  //           image: AssetImage('images/chalkboard_web.jpg'),
  //           fit: BoxFit.fill,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
