import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;

class RootItemWidget extends StatefulWidget {
  final id;
  final title;
  final url;

  RootItemWidget(
      {Key? key,
      required String this.id,
      required String this.title,
      required String this.url})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerScreenVideoState(id, title, url);
  }
}

class _VideoPlayerScreenVideoState extends State<RootItemWidget>
    with SingleTickerProviderStateMixin {
  dynamic _controller;
  dynamic _initializeVideoPlayerFuture;
  final imageId;
  final title;
  final url;
  _VideoPlayerScreenVideoState(
      String this.imageId, String this.title, String this.url);
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

  void _launchURL() {
    js.context.callMethod('open', [url]);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle headerStyle = GoogleFonts.ubuntuMono(
        textStyle: TextStyle(color: Colors.white, fontSize: 15));

    return Container(
      width: 500,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              image: NetworkImage(
                //This is for CORS proxy
                "https://cors-anywhere.herokuapp.com/" + imageId,
              ),
              fit: BoxFit.cover)),
      alignment: Alignment.center,
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
              onTap: () => {_launchURL()},
              child: Material(
                color: animation?.value,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.white,
                      width: 0.5,
                    )),
                elevation: _thisElevation,
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: headerStyle,
                    )),
              ))),
      //   Container(
      //     alignment: Alignment.center,
      //     margin: EdgeInsets.only(top: 10),
      //     child: Text("Hello"),
      //   )
      // ,
    );
  }
}
