import 'package:flutter/material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson.dart';

class ExpansionPanelActivities extends StatelessWidget {
  Lesson lesson;

  ExpansionPanelActivities({this.lesson});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        Container(width: 30, height: 30, color: Colors.red),
        Container(width: 30, height: 30, color: Colors.blueAccent),
        SizedBox(width: 10),
        Text('ExpansionPanelActivities'),
        Spacer(),
        Container(width: 30, height: 30, color: Colors.red),
      ]),
      Row(children: <Widget>[
        Container(width: 30, height: 30, color: Colors.red),
        Container(width: 30, height: 30, color: Colors.blueAccent),
        SizedBox(width: 10),
        Text('ExpansionPanelActivities'),
        Spacer(),
        Container(width: 30, height: 30, color: Colors.red),
      ]),
      Row(children: <Widget>[
        Container(width: 30, height: 30, color: Colors.red),
        Container(width: 30, height: 30, color: Colors.blueAccent),
        SizedBox(width: 10),
        Text('ExpansionPanelActivities'),
        Spacer(),
        Container(width: 30, height: 30, color: Colors.red),
      ])
    ],);
  }
}
