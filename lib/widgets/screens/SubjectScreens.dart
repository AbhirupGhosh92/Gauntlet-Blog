import 'package:flutter/material.dart';

import 'package:gauntletwebapp/widgets/ui/CustomWaveWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gauntletwebapp/widgets/ui/VideoPlayerScreen.dart';

class SubjectScreen extends StatefulWidget {
  final String clickType;

  SubjectScreen({final key, required this.clickType}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SubjectScreenState(clickType);
  }
}

class _SubjectScreenState extends State<SubjectScreen> {
  final String clickType;
  _SubjectScreenState(this.clickType);

  final TextStyle headerStyle = GoogleFonts.ubuntuMono(
      textStyle: TextStyle(color: Colors.white, fontSize: 40));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: AlignmentDirectional.topCenter, children: [
      CustomWaveWidgets(),
      VideoPlayerScreen(
        margin: EdgeInsets.only(left: 0),
      ),
      // ListView(
      //   children: [
      //     Container(
      //         margin: EdgeInsets.only(left: 50, top: 50),
      //         alignment: Alignment.centerLeft,
      //         child: Text(
      //           clickType.replaceAll("\n", " "),
      //           style: headerStyle,
      //         )),
      //     Container(
      //       child: VideoPlayerScreen(),
      //     )
      //   ],
      // ),
    ]));
  }
}
