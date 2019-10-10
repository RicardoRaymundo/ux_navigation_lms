import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/resource/chart/chart_box.dart';
import 'package:ux_navigation/resource/chart/chart_marker_final.dart';
import 'package:ux_navigation/resource/course/lesson/lesson.dart';
import 'package:ux_navigation/ui/ui_label.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class ExpansionPanelTestFinal extends StatelessWidget {
  Lesson lesson;

  ExpansionPanelTestFinal({this.lesson});

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
                    padding: EdgeInsets.only(top: 18, right: 10, bottom: 40),
                    width: width,
                    child: Text(
                      UILabel.FINAL_TEST,
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.left,
                    ),
                  ),
                )
              ],
            )),
        ChartBox(progress: 0.4)
      ]),
    );
  }
}
