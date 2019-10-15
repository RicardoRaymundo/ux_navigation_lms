import 'package:flutter/material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson.dart';
import 'package:ux_navigation/resource/course/lesson/lesson_activity.dart';
import 'package:ux_navigation/resource/expansion_panel/course/activities/course_activities.dart';
import 'package:ux_navigation/resource/expansion_panel/course/activities/header/activities_header_description.dart';
import 'package:ux_navigation/resource/expansion_panel/course/activities/header/activities_header_title.dart';

/// A classe ActivitiesPanel é responsavel pelo gerenciamento das informações de cada lição do curso dentro do painel de expansão
class ActivitiesPanel extends StatefulWidget {
  final Lesson lesson;
  final LessonActivity activity;
  final int index;
  final int total;

  ActivitiesPanel({this.index, this.lesson, this.total, this.activity});

  @override
  _ActivitiesPanelState createState() => _ActivitiesPanelState();
}

class _ActivitiesPanelState extends State<ActivitiesPanel> {
  /// Status indica se o painel está expandido
  bool isExpanded = false;

  void _onToggle() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: _onToggle,
              child: ActivitiesHeaderTitle(index: widget.index, activity: widget.activity, completed: 0.4, isExpanded: isExpanded),
            ),
          ],
        ),
      ),
      secondChild: Container(
          color: Color(0xff000000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: _onToggle,
                child: ActivitiesHeaderTitle(index: widget.index, activity: widget.activity, completed: 0.4, isExpanded: isExpanded),
              ),
              ActivitiesHeaderDescription(
                description: widget.activity.description,
              ),
              CourseActivities(activity: widget.activity),
            ],
          )),
      crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: kThemeAnimationDuration,
    );
  }
}
