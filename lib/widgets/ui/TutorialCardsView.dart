import 'package:flutter/material.dart';

import 'GlowingCardsLayout.dart';

class TutorialCardsView extends StatelessWidget {
  final size = 10000;

  TutorialCardsView({final key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 10000,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GlowingCardsLayout(
                imageUrl: "images/svg/test.svg",
                headerText: "Mobile\nDevelopment",
                subText: "72.7% of all devices run Android in one form or the other. This makes android one of the most sought after mobile platforms for business\n\n" +
                    "With technologies like ract native and flutter we can generate multiple apps for different platforms using a single code base.\n\n" +
                    "So our mobile phones are soon becoming the centre of our lives and having the ability to control the centre is really fruitful.",
                logo: "",
                margin: EdgeInsets.only(
                    top: 100,
                    left: index == 0 ? 50 : 10,
                    right: index == size - 1 ? 50 : 10,
                    bottom: 100),
              );
            }));
  }
}
