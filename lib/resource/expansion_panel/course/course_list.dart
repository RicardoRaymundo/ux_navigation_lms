import 'package:flutter/material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson.dart';
import 'package:ux_navigation/resource/expansion_panel/course/course_panel.dart';

/// A classe CourseList é responsável pela criação da lista de componentes de CoursePanel
class CourseList extends StatelessWidget {
  final List<Lesson> listLesson;

  CourseList(this.listLesson);

  @override
  Widget build(BuildContext context) {
    return Column(children: generateListLesson());
  }

  /// Gera a lista de componentes CoursePanel
  List<Widget> generateListLesson() {
    List<Widget> listResult = [];
    int len = this.listLesson.length;
    for (int i = 0; i < len; i++) {
      listResult.add(CoursePanel(i, len, this.listLesson[i]));
    }
    return listResult;
  }
}
