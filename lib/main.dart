import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gauntletwebapp/widgets/ui/CustomWaveWidget.dart';
import 'package:gauntletwebapp/widgets/ui/HoverImage.dart';
import 'package:gauntletwebapp/widgets/ui/TutorialCardsView.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gauntletwebapp/widgets/ui/GlowingCardsLayout.dart';
import 'package:gauntletwebapp/widgets/ui/ErrorPage.dart';

void main() {
  runApp(MyApp());
}

bool isOpenFromDevice() {
  String agent = window.navigator.userAgent.toString().toLowerCase();
  if (agent.toLowerCase().contains("android") ||
      agent.toLowerCase().contains("iphone") ||
      agent.toLowerCase().contains("ipad")) {
    return true;
  } else {
    return false;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gauntlet',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.black87,
      ),
      home: GauntletHomePage(),
    );
  }
}

class GauntletHomePage extends StatefulWidget {
  GauntletHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GauntletHomePage> {
  dynamic subTextStyle = GoogleFonts.dancingScript(
      textStyle: TextStyle(color: Colors.white, fontSize: 30));
  dynamic textStyle = GoogleFonts.pacifico(
      textStyle: TextStyle(color: Colors.white, fontSize: 80));
  dynamic summaryStyle = GoogleFonts.ubuntuMono(
      textStyle: TextStyle(color: Colors.white, fontSize: 20));

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: kIsWeb && !isOpenFromDevice()
          ? Container(
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  CustomWaveWidgets(),
                  PageView(
                    scrollDirection: Axis.vertical,
                    controller: PageController(),
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 100.0),
                            child: FittedBox(
                                child: Text("Welcome", style: textStyle)),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 100.0, left: 50, right: 50),
                            child: Text(
                                "\"Here's to the crazy ones, the misfits, the rebels, the troublemakers, the round pegs in the square holes ... the ones who see things differently -- they're not fond of rules, and they have no respect for the status quo. ... You can quote them, disagree with them, glorify or vilify them, but the only thing you can't do is ignore them because they change things. ... They push the human race forward, and while some may see them as the crazy ones, we see genius, because the people who are crazy enough to think that they can change the world, are the ones who do.\"\n-Steve Jobs",
                                textAlign: TextAlign.center,
                                style: subTextStyle),
                          ),
                        ],
                      ),
                      Column(children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            margin:
                                EdgeInsets.only(top: 0.0, left: 50, right: 50),
                            child: FittedBox(
                              child: Text("What makes a great Product",
                                  style: textStyle),
                            )),
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: 50, left: 50, right: 50, bottom: 100),
                            child: Text(
                              "A great product is a combination of good artistic taste and cutting edge technology, melding into an " +
                                  "amalgamation, capable of solving a problem in the easiest way possible. It should be easy to use, intuitive " +
                                  "and most importantly it should do what it does better than the rest.\n\n\n\n" +
                                  "All around us we have many examples of such great products. Products which are integral part of our lives" +
                                  " which have made us rely on them so much that we cannot imagine a world without them. They all have the characteristics " +
                                  "of a great prodect , a good design and cutting edge technology combined together to solve a problem better than the rest.\n\n\n\n" +
                                  " Yet looking back a few years from now , most of these products didnot exist and most of the problems that they solve now were not problems then." +
                                  "I believe that there are a number of problems that we donot see yet , and there are an equal number of elegant products " +
                                  "to be built to solve these problems.",
                              style: summaryStyle,
                              textAlign: TextAlign.center,
                            ))
                      ]),

                      Column(children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin:
                              EdgeInsets.only(top: 0.0, left: 50, right: 50),
                          child: FittedBox(
                              child:
                                  Text("A complete package", style: textStyle)),
                        ),
                        Container(child: TutorialCardsView())
                      ]),

                      //Bottom Links

                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HoverImage(
                                imageUrl: "images/svg/linkedin.svg",
                                hoverColour: Colors.blue.shade800,
                                redirectionUrl:
                                    "https://www.linkedin.com/in/abhirupghosh92/",
                              ),
                              HoverImage(
                                  imageUrl: "images/svg/github.svg",
                                  hoverColour: Colors.black,
                                  redirectionUrl:
                                      "https://github.com/AbhirupGhosh92"),
                              HoverImage(
                                  imageUrl: "images/svg/kaggle.svg",
                                  hoverColour: Colors.blue,
                                  redirectionUrl:
                                      "https://www.kaggle.com/ezzzio")
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            )
          : ErrorPage(),
    );
  }
}
