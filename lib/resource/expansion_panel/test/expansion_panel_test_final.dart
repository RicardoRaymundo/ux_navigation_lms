import 'package:flutter/material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson.dart';

class ExpansionPanelTestFinal extends StatelessWidget {
  Lesson lesson;

  ExpansionPanelTestFinal({this.lesson});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(width: 30, height: 30, color: Colors.red),
      Container(width: 30, height: 30, color: Colors.blueAccent),
      SizedBox(width: 10),
      Text('ExpansionPanelTestFinal'),
      Spacer(),
      Container(width: 30, height: 30, color: Colors.red),
    ]);
  }
}
