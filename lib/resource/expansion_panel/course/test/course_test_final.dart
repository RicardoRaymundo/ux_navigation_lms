import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/resource/chart/chart_box.dart';
import 'package:ux_navigation/resource/chart/chart_marker_final.dart';
import 'package:ux_navigation/resource/course/lesson/test/test_final.dart';
import 'package:ux_navigation/ui/ui_label.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class CourseTestFinal extends StatelessWidget {
  final List<TestFinal> listTestFinal;

  CourseTestFinal({this.listTestFinal});

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery
        .of(context)
        .size
        .width - 132);
    return IntrinsicHeight(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ChartMarkerFinal(progress: 1.0),
        Container(
          width: 32,
          height: 40,
          child: SvgPicture.asset(UiSVG.ICON_TEST),
        ),
        ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width, minHeight: 40),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 16, right: 10, bottom: 20),
                    width: width,
                    child: Text(
                      UILabel.FINAL_TEST,
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                  ),
                )
              ],
            )),
        ChartBox(progress: 0.3)
      ]),
    );
  }
}
