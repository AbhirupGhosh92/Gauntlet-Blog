import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gauntletwebapp/widgets/ui/CustomWaveWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gauntletwebapp/widgets/ui/VideoPlayerScreenVideo.dart';

class SubjectScreen extends StatefulWidget {
  final String? clickType;

  SubjectScreen({final key, required this.clickType}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SubjectScreenState(clickType!);
  }
}

class _SubjectScreenState extends State<SubjectScreen> {
  final String clickType;
  Map<String, dynamic> _itemList = HashMap();
  String header = "";

  _SubjectScreenState(this.clickType);

  final TextStyle headerStyle = GoogleFonts.ubuntuMono(
      textStyle: TextStyle(color: Colors.white, fontSize: 40));

  @override
  void initState() {
    super.initState();
    _readConfig();
  }

  _readConfig() async {
    try {
      //_itemList["header"] = "";
      String config = await rootBundle.loadString('extras/config.json');

      setState(() {
        _itemList = jsonDecode(config);
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: AlignmentDirectional.topStart, children: [
      CustomWaveWidgets(),
      Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Text(
                _itemList["subject"] == null
                    ? ""
                    : _itemList["subject"][clickType]["title"],
                style: headerStyle),
          ),
          // GridView.builder(
          //     itemCount: 20,
          //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //       maxCrossAxisExtent: 10,
          //     ),
          //     itemBuilder: (context, index) {
          //       return VideoPlayerScreenVideo(margin: EdgeInsets.only(left: 0));
          //     })
        ],
      )
    ])
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
        );
  }
}
