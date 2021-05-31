import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorPage extends StatelessWidget {
  dynamic summaryStyle = GoogleFonts.ubuntuMono(
      textStyle: TextStyle(color: Colors.white, fontSize: 20));

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 40, right: 40),
        alignment: Alignment.center,
        child: Text(
          "Sorry the site is not optimised for mobile devices yet , To see it in its full glory please open it on a computer",
          style: summaryStyle,
          textAlign: TextAlign.center,
        ));
  }
}
