import 'package:flutter/material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson_activity.dart';
import 'package:ux_navigation/resource/course/lesson/lesson_activity_additional_material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson_activity_weblink.dart';
import 'package:ux_navigation/resource/expansion_panel/course/activities/course_activities_additional_material.dart';
import 'package:ux_navigation/resource/expansion_panel/course/activities/course_activities_weblink.dart';
import 'package:ux_navigation/resource/expansion_panel/course/test/course_test_comprehension.dart';

class CourseActivities extends StatelessWidget {
  final LessonActivity activity;

  CourseActivities({this.activity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CourseTestComprehension(),
        this._generateCourseActivitiesAdditionalMaterial(this.activity.listLessonActivityAdditionalMaterial),
        this._generateCourseActivitiesWeblink(this.activity.listLessonActivityWeblink),
      ],
    );
  }

  ///
  Widget _generateCourseActivitiesAdditionalMaterial(List<LessonActivityAdditionalMaterial> listLessonActivityAdditionalMaterial) {
    List<Widget> listResult = [];
    int len = listLessonActivityAdditionalMaterial.length;
    for (int i = 0; i < len; i++) {
      listResult.add(
        CourseActivitiesAdditionalMaterial(lessonActivityAdditionalMaterial: listLessonActivityAdditionalMaterial[i]),
      );
    }
    return Column(children: listResult);
  }

  ///
  Widget _generateCourseActivitiesWeblink(List<LessonActivityWeblink> listLessonActivityWeblink) {
    List<Widget> listResult = [];
    int len = listLessonActivityWeblink.length;
    for (int i = 0; i < len; i++) {
      listResult.add(
        CourseActivitiesWeblink(
          lessonActivityWeblink: listLessonActivityWeblink[i],
        ),
      );
    }
    return Column(children: listResult);
  }
}
