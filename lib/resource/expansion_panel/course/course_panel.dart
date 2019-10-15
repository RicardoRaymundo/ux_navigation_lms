import 'package:flutter/material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson.dart';
import 'package:ux_navigation/resource/course/lesson/lesson_activity.dart';
import 'package:ux_navigation/resource/expansion_panel/course/course_content.dart';
import 'package:ux_navigation/resource/expansion_panel/course/header/course_header_description.dart';
import 'package:ux_navigation/resource/expansion_panel/course/header/course_header_info.dart';
import 'package:ux_navigation/resource/expansion_panel/course/header/course_header_title.dart';
import 'package:ux_navigation/resource/util.dart';

/// A classe CoursePanel é responsavel pelo gerenciamento das informações de cada lição do curso dentro do painel de expansão
class CoursePanel extends StatefulWidget {
  final Lesson data;
  final int index;
  final int total;

  CoursePanel(this.index, this.total, this.data);

  @override
  _CoursePanelState createState() => _CoursePanelState();
}

class _CoursePanelState extends State<CoursePanel> {
  /// Status indica se o painel está expandido
  bool isExpanded = false;

  void _onToggle() {
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
                onTap: _onToggle,
                child: CourseHeaderTitle(index: widget.index, title: widget.data.title, completed: 0.0, isExpanded: isExpanded),
              ),
              SizedBox(height: 5),
              CourseHeaderDescription(description: widget.data.description),
              SizedBox(height: 15),
              CourseHeaderInfo(index: widget.index,
                  total: widget.total,
                  time: this._time(),
                  performance: 0.75,
                  badge: 2),
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
                  onTap: _onToggle,
                  child: CourseHeaderTitle(index: widget.index, title: widget.data.title, completed: 0.0, isExpanded: isExpanded),
                ),
                SizedBox(height: 5),
                CourseHeaderDescription(description: widget.data.description),
                SizedBox(height: 15),
                CourseHeaderInfo(index: widget.index,
                    total: widget.total,
                    time: this._time(),
                    performance: 0.75,
                    badge: 2),
                SizedBox(height: 10),
                CourseContent(widget.data)
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
    widget.data.listLessonActivity.forEach((LessonActivity item) {
      result = Util.calculateTime(result, item.duration);
    });
    return result;
  }
}
