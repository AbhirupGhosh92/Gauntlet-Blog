import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'GlowingCardsLayout.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class TutorialCardsView extends StatefulWidget {
  TutorialCardsView({final key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TutorialCardsViewState();
  }
}

class _TutorialCardsViewState extends State<TutorialCardsView> {
  var _itemCount = 0;
  List<dynamic> _itemList = List<dynamic>.empty();

  _readConfig() async {
    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref('/blog_config/config.json');

      var dats = await ref.getData();
      var s = new String.fromCharCodes(dats!);
      Map<String, dynamic> config_json = jsonDecode(s);
      setState(() {
        _itemList = config_json["title_cards_tutorials"];
        _itemCount = _itemList.length;
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    _readConfig();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _itemCount,
            scrollDirection: Axis.horizontal,
            itemBuilder: (
              context,
              index,
            ) {
              return GlowingCardsLayout(
                imageUrl: _itemList[index]['icon_url'],
                headerText: _itemList[index]['header'],
                subText: _itemList[index]['sub_text'],
                id: _itemList[index]['id'],
                margin: EdgeInsets.only(
                    top: 100,
                    left: index == 0 ? 50 : 10,
                    right: index == _itemCount - 1 ? 50 : 10,
                    bottom: 100),
              );
            }));
  }
}
