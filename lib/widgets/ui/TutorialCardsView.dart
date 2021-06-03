import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'GlowingCardsLayout.dart';

class TutorialCardsView extends StatefulWidget {
  TutorialCardsView({final key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TutorialCardsViewState();
  }
}

class _TutorialCardsViewState extends State<TutorialCardsView> {
  var _itemCount = 0;
  List<dynamic> itemList = List<dynamic>.empty();
  void _readConfig() async {
    String config = await rootBundle.loadString('extras/config.json');
    Map<String, dynamic> config_json = jsonDecode(config);
    setState(() {
      _itemCount = itemList.length;
      itemList = config_json["title_cards_tutorials"];
    });
  }

  @override
  Widget build(BuildContext context) {
    _readConfig();

    return Expanded(
        child: ListView.builder(
            itemCount: _itemCount,
            scrollDirection: Axis.horizontal,
            itemBuilder: (
              context,
              index,
            ) {
              return GlowingCardsLayout(
                imageUrl: itemList[index]['icon_url'],
                headerText: itemList[index]['header'],
                subText: itemList[index]['sub_text'],
                id: itemList[index]['id'],
                margin: EdgeInsets.only(
                    top: 100,
                    left: index == 0 ? 50 : 10,
                    right: index == _itemCount - 1 ? 50 : 10,
                    bottom: 100),
              );
            }));
  }
}
