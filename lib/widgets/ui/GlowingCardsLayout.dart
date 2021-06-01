import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GlowingCardsLayout extends StatelessWidget {
  final String imageUrl;
  final String headerText;
  final String subText;
  final String logo;
  EdgeInsetsGeometry? margin;

  GlowingCardsLayout(
      {Key? key,
      required this.imageUrl,
      required this.headerText,
      required this.subText,
      required this.logo,
      required this.margin});

  final headerStyle = GoogleFonts.ubuntuMono(
      textStyle: TextStyle(color: Colors.white, fontSize: 20));
  final headerSubStyle = GoogleFonts.ubuntuMono(
      textStyle: TextStyle(color: Colors.white, fontSize: 15.0));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: margin,
      alignment: Alignment.topLeft,
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: Colors.white,
              width: 2.5,
            )),
        elevation: 0,
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
                          semanticsLabel: logo,
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
      ),
    );
  }
}
