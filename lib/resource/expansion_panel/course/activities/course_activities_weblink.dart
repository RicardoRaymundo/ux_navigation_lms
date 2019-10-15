import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/resource/chart/chart_box.dart';
import 'package:ux_navigation/resource/course/lesson/lesson_activity_weblink.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class CourseActivitiesWeblink extends StatelessWidget {
  final LessonActivityWeblink lessonActivityWeblink;

  CourseActivitiesWeblink({this.lessonActivityWeblink});

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 132);
    double widthLeft = (MediaQuery.of(context).size.width - 162);

    return IntrinsicHeight(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //ChartMarkerLeft(progress: 0.7),
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Container(
                color: Color(0xff363636),
                width: 4,
              ),
              Container(
                width: 30,
                child: SvgPicture.asset(UiSVG.CHART_MARKER_LEFT_LINE),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Container(
                width: 30,
                child: SvgPicture.asset(UiSVG.CHART_MARKER_LEFT),
              ),
            ],
          ),
        ),
        Container(
          width: 32,
          height: 40,
          child: SvgPicture.asset(UiSVG.ICON_LINK),
        ),
        ConstrainedBox(
            constraints: BoxConstraints(maxWidth: widthLeft, minHeight: 40),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                      padding: EdgeInsets.only(top: 18, right: 10, bottom: 15),
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            this.lessonActivityWeblink.title,
                            style: TextStyle(fontSize: 13, color: Colors.grey[300]),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 2),
                          Text(
                            this.lessonActivityWeblink.description,
                            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )),
                )
              ],
            )),
        ChartBox(progress: 0.7)
      ]),
    );
  }
}
