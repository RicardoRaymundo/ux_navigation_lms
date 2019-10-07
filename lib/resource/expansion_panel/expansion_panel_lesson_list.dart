import 'package:flutter/material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson.dart';
import 'package:ux_navigation/resource/expansion_panel/expansion_panel_lesson.dart';

/// A classe ExpansionPanelLessonList é responsável pela criação da lista de componentes de ExpansionPanelLesson
class ExpansionPanelLessonList extends StatelessWidget {
  List<Lesson> data;

  ExpansionPanelLessonList(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(children: listLesson());
  }

  /// Gera a lista de componentes ExpansionPanelLesson
  List<Widget> listLesson() {
    List<Widget> listResult = [];
    int len = this.data.length;
    for (int i = 0; i < len; i++) {
      listResult.add(ExpansionPanelLesson(i, len, this.data[i]));
    }
    return listResult;
  }
}
