import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HoverImage extends StatefulWidget {
  final String imageUrl;
  final Color hoverColour;
  HoverImage({Key? key, required this.imageUrl, required this.hoverColour})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HoverImageState(hoverColour, imageUrl);
  }
}

class HoverImageState extends State<HoverImage> {
  Color oldColor = Colors.white;
  final Color hoverColour;
  final String imageUrl;

  HoverImageState(this.hoverColour, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        imageUrl,
        color: oldColor,
        semanticsLabel: "",
        width: 70,
        height: 70,
      ),
    );
  }
}
