import 'package:flutter/material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson.dart';
import 'package:ux_navigation/resource/expansion_panel/course/activities/activities_list.dart';
import 'package:ux_navigation/resource/expansion_panel/course/test/course_test_final.dart';
import 'package:ux_navigation/resource/expansion_panel/course/test/course_test_placement.dart';

/// A classe CourseContent é responsável pela criação da lista de conteúdos do painel
class CourseContent extends StatelessWidget {
  final Lesson lesson;

  CourseContent(this.lesson);

  @override
  Widget build(BuildContext context) {
    Container container = Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CourseTestPlacement(listTestPlacement: this.lesson.listTestPlacement),
            ActivitiesList(lesson: this.lesson),
            CourseTestFinal(listTestFinal: this.lesson.listTestFinal)
          ],
        ));
    return container;
  }
}
