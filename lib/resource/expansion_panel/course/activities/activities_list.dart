import 'package:flutter/material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson.dart';
import 'package:ux_navigation/resource/expansion_panel/course/activities/activities_panel.dart';

/// A classe ActivitiesList é responsável pela criação da lista de componentes de CoursePanel
class ActivitiesList extends StatelessWidget {
  final Lesson lesson;

  ActivitiesList({this.lesson});

  @override
  Widget build(BuildContext context) {
    return Column(children: generateLessonActivities());
  }

  /// Gera a lista de componentes CoursePanel
  List<Widget> generateLessonActivities() {
    List<Widget> listResult = [];
    int len = this.lesson.listLessonActivity.length;
    for (int i = 0; i < len; i++) {
      listResult.add(ActivitiesPanel(index: i, total: len, lesson: this.lesson, activity: this.lesson.listLessonActivity[i]));
    }
    return listResult;
  }
}
