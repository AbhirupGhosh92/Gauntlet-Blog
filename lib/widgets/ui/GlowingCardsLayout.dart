import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GlowingCardsLayout extends StatelessWidget {
  GlowingCardsLayout(
      {Key? key,
      required this.imageUrl,
      required this.headerText,
      required this.subText})
      : super(key: key);

  final imageUrl;
  final headerText;
  final subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 0,
        child: Column(
          children: [
            SvgPicture.asset(
              imageUrl,
              color: Colors.white,
              semanticsLabel: 'Acme Logo',
              width: 200,
              height: 200,
            ),
            Text(headerText),
            Text(subText),
          ],
        ),
      ),
    );
  }
}
