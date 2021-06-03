import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gauntletwebapp/widgets/screens/SubjectScreens.dart';
import 'package:google_fonts/google_fonts.dart';

class GlowingCardsLayout extends StatefulWidget {
  final String imageUrl;
  final String headerText;
  final String subText;
  final String id;
  EdgeInsetsGeometry? margin;

  GlowingCardsLayout(
      {Key? key,
      required this.imageUrl,
      required this.headerText,
      required this.subText,
      required this.id,
      required this.margin})
      : super(key: key);

  final headerStyle = GoogleFonts.ubuntuMono(
      textStyle: TextStyle(color: Colors.white, fontSize: 20));
  final headerSubStyle = GoogleFonts.ubuntuMono(
      textStyle: TextStyle(color: Colors.white, fontSize: 15.0));

  @override
  State<StatefulWidget> createState() {
    return _GlowingCardState(
        imageUrl, margin, id, headerText, subText, headerStyle, headerSubStyle);
  }
}

class _GlowingCardState extends State<GlowingCardsLayout>
    with SingleTickerProviderStateMixin {
  final String imageUrl;
  final EdgeInsetsGeometry? margin;
  final String id;
  final String headerText;
  final String subText;
  final TextStyle headerStyle;
  final TextStyle headerSubStyle;

  double _thisElevation = 1.0;
  Color defaultColor = Colors.black.withOpacity(0.01);
  AnimationController? controller;
  Animation<Color?>? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = ColorTween(
            begin: Colors.black.withOpacity(0.01),
            end: Colors.black.withOpacity(0.2))
        .animate(controller!)
          ..addListener(() {
            setState(() {
              // The state that has changed here is the animation object’s value.
            });
          });
  }

  _GlowingCardState(this.imageUrl, this.margin, this.id, this.headerText,
      this.subText, this.headerStyle, this.headerSubStyle);

  void changeValue(bool forward) {
    if (forward) {
      controller?.forward();
    } else {
      controller?.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 380,
      margin: margin,
      alignment: Alignment.topLeft,
      child: MouseRegion(
          onEnter: (event) => {
                setState(() {
                  controller?.forward();
                })
              },
          onExit: (event) => {
                setState(() {
                  controller?.reverse();
                })
              },
          child: GestureDetector(
              onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SubjectScreen(
                                  clickType: id,
                                )))
                  },
              child: Material(
                color: animation?.value,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.white,
                      width: 2.5,
                    )),
                elevation: _thisElevation,
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(top: 20, right: 20),
                                child: SvgPicture.asset(
                                  imageUrl,
                                  color: Colors.white,
                                  semanticsLabel: "",
                                  width: 70,
                                  height: 70,
                                )),
                            Container(
                                margin: EdgeInsets.only(right: 20, top: 20),
                                child: Text(
                                  headerText,
                                  style: headerStyle,
                                )),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 20),
                            child: Text(
                              subText,
                              textAlign: TextAlign.justify,
                              style: headerSubStyle,
                            ))
                      ],
                    )),
              ))),
    );
  }
}
