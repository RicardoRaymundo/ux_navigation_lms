import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/resource/chart/chart_marker.dart';
import 'package:ux_navigation/resource/chart/chart_progress.dart';
import 'package:ux_navigation/resource/course/lesson/lesson.dart';
import 'package:ux_navigation/resource/expansion_panel/activities/expansion_panel_activities_document.dart';
import 'package:ux_navigation/resource/expansion_panel/activities/expansion_panel_activities_link.dart';
import 'package:ux_navigation/resource/expansion_panel/test/expansion_panel_test_comprehension.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class ExpansionPanelActivities extends StatelessWidget {
  Lesson lesson;

  ExpansionPanelActivities({this.lesson});

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 132);
    double widthLeft = (MediaQuery.of(context).size.width - 162);

    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            IntrinsicHeight(
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ChartMarker(progress: 5.0),
                Container(
                  width: 32,
                  height: 40,
                  child: SvgPicture.asset(UiSVG.ICON_VIDEO),
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: width, minHeight: 40),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(top: 18, right: 10),
                            width: width,
                            child: Text(
                              'A1P1 - A fotografia digital - A fotografia digital',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        )
                      ],
                    )),
                ChartProgress(progress: 1.0)
              ]),
            ),
            Column(
              children: <Widget>[
                ExpansionPanelTestComprehension(),
                ExpansionPanelTestComprehension(),
                ExpansionPanelActivitiesDocument(),
                ExpansionPanelActivitiesLink()
              ],
            )
          ],
        ),
        Column(
          children: <Widget>[
            IntrinsicHeight(
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ChartMarker(progress: 5.0),
                Container(
                  width: 32,
                  height: 40,
                  child: SvgPicture.asset(UiSVG.ICON_VIDEO),
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: width, minHeight: 40),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(top: 18, right: 10),
                            width: width,
                            child: Text(
                              'A1P1 - A fotografia digital - A fotografia digital',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        )
                      ],
                    )),
                ChartProgress(progress: 0.4)
              ]),
            ),
            Column(
              children: <Widget>[
                ExpansionPanelTestComprehension(),
                ExpansionPanelTestComprehension(),
                ExpansionPanelActivitiesDocument(),
                ExpansionPanelActivitiesLink()
              ],
            )
          ],
        ),
      ],
    );
  }
}
