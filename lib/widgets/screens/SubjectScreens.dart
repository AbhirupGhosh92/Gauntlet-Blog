import 'package:flutter/material.dart';
import 'package:gauntletwebapp/widgets/ui/CustomWaveWidget.dart';

class SubjectScreen extends StatefulWidget {
  final String clickType;

  SubjectScreen({final key, required this.clickType}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SubjectScreenState(clickType);
  }
}

class _SubjectScreenState extends State<SubjectScreen> {
  final String clickType;
  _SubjectScreenState(this.clickType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: AlignmentDirectional.topCenter, children: [
      CustomWaveWidgets(),
      ListView(
        children: [Text("Hello world its Loco")],
      ),
    ]));
  }
}
