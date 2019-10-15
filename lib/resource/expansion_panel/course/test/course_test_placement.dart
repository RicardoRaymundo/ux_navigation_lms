import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/resource/chart/chart_box.dart';
import 'package:ux_navigation/resource/chart/chart_marker.dart';
import 'package:ux_navigation/resource/course/lesson/test/test_placement.dart';
import 'package:ux_navigation/ui/ui_label.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class CourseTestPlacement extends StatelessWidget {
  final List<TestPlacement> listTestPlacement;

  CourseTestPlacement({this.listTestPlacement});

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery
        .of(context)
        .size
        .width - 132);

    return IntrinsicHeight(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ChartMarker(progress: 5.0),
        Container(
          width: 32,
          height: 40,
          child: SvgPicture.asset(UiSVG.ICON_TEST),
        ),
        ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 15, right: 10),
                    width: width,
                    child: Text(
                      UILabel.PLACEMENT_TEST,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                  ),
                )
              ],
            )),
        ChartBox(progress: 0.5)
      ]),
    );
  }
}
