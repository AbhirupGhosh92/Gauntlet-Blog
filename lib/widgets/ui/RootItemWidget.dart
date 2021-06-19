import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:video_player_web/video_player_web.dart';

class RootItemWidget extends StatefulWidget {
  final margin;

  RootItemWidget({Key? key, required this.margin}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerScreenVideoState(margin);
  }
}

class _VideoPlayerScreenVideoState extends State<RootItemWidget>
    with SingleTickerProviderStateMixin {
  final margin;
  dynamic _controller;
  dynamic _initializeVideoPlayerFuture;

  _VideoPlayerScreenVideoState(this.margin);
  AnimationController? controller;
  Animation<Color?>? animation;
  double _thisElevation = 1.0;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = ColorTween(
            begin: Colors.black.withOpacity(0.01),
            end: Colors.black.withOpacity(0.2))
        .animate(controller!)
          ..addListener(() {
            setState(() {
              // The state that has changed here is the animation object’s value.
            });
          });
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      height: 200.0,
      margin: margin,
      alignment: Alignment.topLeft,
      child: MouseRegion(
          onEnter: (event) => {
                setState(() {
                  controller?.forward();
                })
              },
          onExit: (event) => {
                setState(() {
                  controller?.reverse();
                })
              },
          child: GestureDetector(
              onTap: () => {
                    //TODO add url redirect
                  },
              child: Material(
                color: animation?.value,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.white,
                      width: 2.5,
                    )),
                elevation: _thisElevation,
                child: Container(
                  alignment: Alignment.topLeft,
                ),
              ))),
    );
  }
}
