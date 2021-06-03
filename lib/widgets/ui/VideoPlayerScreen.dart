import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:video_player_web/video_player_web.dart';

class VideoPlayerScreen extends StatefulWidget {
  final margin;

  VideoPlayerScreen({Key? key, required this.margin}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerScreenState(margin);
  }
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen>
    with SingleTickerProviderStateMixin {
  final margin;
  dynamic _controller;
  dynamic _initializeVideoPlayerFuture;

  _VideoPlayerScreenState(this.margin);
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
      width: 300,
      height: 380,
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
