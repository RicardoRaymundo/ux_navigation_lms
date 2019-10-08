import 'package:flutter/material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson.dart';
import 'package:ux_navigation/resource/expansion_panel/expansion_panel_activities.dart';
import 'package:ux_navigation/resource/expansion_panel/test/expansion_panel_test_final.dart';
import 'package:ux_navigation/resource/expansion_panel/test/expansion_panel_test_placement.dart';

/// A classe ExpansionPanelContent é responsável pela criação da lista de conteúdos do painel
class ExpansionPanelContent extends StatelessWidget {
  Lesson data;

  ExpansionPanelContent(this.data);

  @override
  Widget build(BuildContext context) {
    Container container = Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ExpansionPanelTestPlacement(lesson: this.data),
            ExpansionPanelActivities(lesson: this.data),
            ExpansionPanelTestFinal(lesson: this.data)
          ],
        ));
    return container;
  }
}
