import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gauntletwebapp/widgets/ui/CustomWaveWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gauntletwebapp/widgets/ui/RootItemWidget.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
  final TextStyle subHeaderStyle = GoogleFonts.ubuntuMono(
      textStyle: TextStyle(color: Colors.white, fontSize: 30));

  @override
  void initState() {
    super.initState();
    _readConfig();
  }

  _readConfig() async {
    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref('/blog_config/config.json');
      //_itemList["header"] = "";
      var dats = await ref.getData();
      var s = new String.fromCharCodes(dats!);
      setState(() {
        _itemList = jsonDecode(s);
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
      _itemList["subject"] != null
          ? ListView(
              shrinkWrap: true,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 50, bottom: 50),
                  child: Text(
                      _itemList["subject"] == null
                          ? ""
                          : _itemList["subject"][clickType]["title"],
                      style: headerStyle),
                ),
                Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount:
                            _itemList["subject"][clickType]["items"].length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return Column(children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(bottom: 20),
                                child: Text(
                                    _itemList["subject"][clickType]["items"]
                                        [index]["title"],
                                    style: subHeaderStyle)),
                            Container(
                                margin: EdgeInsets.only(bottom: 50),
                                child: GridView.count(
                                    shrinkWrap: true,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20,
                                    crossAxisCount: 5,
                                    childAspectRatio: 1.5,
                                    children: List.generate(
                                        _itemList["subject"][clickType]["items"]
                                                [index]["sub_items"]
                                            .length, (subIndex) {
                                      var temp = _itemList["subject"][clickType]
                                              ["items"][index]["sub_items"]
                                          [subIndex];
                                      return RootItemWidget(
                                          url: temp["url"],
                                          title: temp["title"],
                                          id: temp["id"]);
                                    })))
                          ]);
                        }))
              ],
            )
          : Container()
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
