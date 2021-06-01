import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:js' as js;

class HoverImage extends StatefulWidget {
  final String imageUrl;
  final Color hoverColour;
  final String redirectionUrl;
  HoverImage(
      {Key? key,
      required this.imageUrl,
      required this.hoverColour,
      required this.redirectionUrl})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HoverImageState(hoverColour, imageUrl, redirectionUrl);
  }
}

class HoverImageState extends State<HoverImage>
    with SingleTickerProviderStateMixin {
  Color oldColor = Colors.white;
  final Color hoverColour;
  final String imageUrl;
  final redirectionUrl;
  AnimationController? controller;
  Animation<Color?>? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation =
        ColorTween(begin: oldColor, end: hoverColour).animate(controller!)
          ..addListener(() {
            setState(() {
              // The state that has changed here is the animation object’s value.
            });
          });
  }

  HoverImageState(this.hoverColour, this.imageUrl, this.redirectionUrl);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onHover: (event) => {
              setState(() => {controller?.forward()})
            },
        onExit: (event) => {
              setState(() => {controller?.reverse()})
            },
        child: GestureDetector(
            onTap: () => {
                  js.context.callMethod('open', [redirectionUrl])
                },
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: SvgPicture.asset(
                imageUrl,
                color: animation?.value,
                semanticsLabel: "",
                width: 70,
                height: 70,
              ),
            )));
  }
}
