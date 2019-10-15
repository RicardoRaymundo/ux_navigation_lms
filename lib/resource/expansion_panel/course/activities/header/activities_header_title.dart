import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/resource/chart/chart_marker.dart';
import 'package:ux_navigation/resource/chart/chart_progress.dart';
import 'package:ux_navigation/resource/course/lesson/lesson_activity.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class ActivitiesHeaderTitle extends StatelessWidget {
  final int index;
  final double completed;
  final bool isExpanded;
  final LessonActivity activity;

  ActivitiesHeaderTitle({this.index, this.activity, this.completed, this.isExpanded});

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 133);

    return IntrinsicHeight(
      child: Container(
        // color: Colors.red,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ChartMarker(progress: 5.0),
          Container(
            width: 32,
            height: 32,
            child: SvgPicture.asset(UiSVG.ICON_VIDEO),
          ),
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: width),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 14, right: 10),
                      width: width,
                      child: Text(
                        this.activity.title,
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  )
                ],
              )),
          ChartProgress(progress: this.completed, isExpanded: this.isExpanded),
        ]),
      ),
    );
  }
}
