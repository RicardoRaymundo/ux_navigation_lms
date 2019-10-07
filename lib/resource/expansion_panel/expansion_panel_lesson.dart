import 'package:flutter/material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson.dart';
import 'package:ux_navigation/resource/course/lesson/lesson_activity.dart';
import 'package:ux_navigation/resource/expansion_panel/expansion_panel_activities.dart';
import 'package:ux_navigation/resource/expansion_panel/expansion_panel_description.dart';
import 'package:ux_navigation/resource/expansion_panel/expansion_panel_info.dart';
import 'package:ux_navigation/resource/expansion_panel/expansion_panel_title.dart';
import 'package:ux_navigation/resource/expansion_panel/test/expansion_panel_test_comprehension.dart';
import 'package:ux_navigation/resource/expansion_panel/test/expansion_panel_test_placement.dart';
import 'package:ux_navigation/resource/util.dart';

/// A classe ExpansionPanelLesson é responsavel pelo gerenciamento das informações de cada lição do curso dentro do painel de expansão
class ExpansionPanelLesson extends StatefulWidget {
  Lesson data;
  int index;
  int total;

  ExpansionPanelLesson(this.index, this.total, this.data);

  @override
  _ExpansionPanelLessonState createState() => _ExpansionPanelLessonState();
}

class _ExpansionPanelLessonState extends State<ExpansionPanelLesson> {
  /// Status indica se o painel está espandido
  bool isExpanded = false;

  void _toggle() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2),
      child: AnimatedCrossFade(
        firstChild: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: _toggle,
                child: ExpansionPanelTitle(index: widget.index, title: widget.data.title, completed: 0.0, isExpanded: isExpanded),
              ),
              SizedBox(height: 5),
              ExpansionPanelDescription(description: widget.data.description),
              SizedBox(height: 15),
              ExpansionPanelInfo(index: widget.index, total: widget.total, time: this._time(), performance: 0.75, badge: 2),
              SizedBox(height: 10),
            ],
          ),
        ),
        secondChild: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: _toggle,
                  child: ExpansionPanelTitle(index: widget.index, title: widget.data.title, completed: 0.0, isExpanded: isExpanded),
                ),
                SizedBox(height: 5),
                ExpansionPanelDescription(description: widget.data.description),
                SizedBox(height: 15),
                ExpansionPanelInfo(index: widget.index, total: widget.total, time: this._time(), performance: 0.75, badge: 2),
                SizedBox(height: 10),
                ExpansionPanelTestPlacement(lesson: widget.data),
                ExpansionPanelActivities(lesson: widget.data),
                ExpansionPanelTestComprehension(lesson: widget.data)
              ],
            )),
        crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      ),
    );
  }

  /// Cálcula o tempo total dos vídeos na lição
  String _time() {
    String result = '00:00';
    widget.data.activities.forEach((LessonActivity item) {
      result = Util.calculateTime(result, item.duration);
    });
    return result;
  }
}
