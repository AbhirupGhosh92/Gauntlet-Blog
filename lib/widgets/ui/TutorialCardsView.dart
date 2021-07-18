import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
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
    // String config = await rootBundle.loadString('extras/config.json');
    // Map<String, dynamic> config_json = jsonDecode(config);
    // setState(() {
    //   itemList = config_json["title_cards_tutorials"];
    //   _itemCount = itemList.length;
    // });

    try {
      var data = await http.get(Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/gauntlet-260920.appspot.com/o/blog_config%2Fconfig.json?alt=media&token=d8b17647-7c8e-473d-8fe5-310de873845c'));
      setState(() {
        Map<String, dynamic> config_json = jsonDecode(data.body);
        setState(() {
          itemList = config_json["title_cards_tutorials"];
          _itemCount = itemList.length;
        });
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
