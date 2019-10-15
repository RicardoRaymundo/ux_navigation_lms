import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class ChartProgress extends StatelessWidget {
  final double progress;
  final bool isExpanded;
  final String time;

  ChartProgress({this.progress = 0.0, this.time = '07:25', this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    String percentage = (this.progress * 100).floor().toString();

    SvgPicture colorCompleted(double value) {
      String assetName = UiSVG.CHART_PROGRESS;
      if (value >= 1.0) {
        assetName = UiSVG.CHART_PROGRESS_100;
      } else if (value >= 0.90) {
        assetName = UiSVG.CHART_PROGRESS_90;
      } else if (value >= 0.80) {
        assetName = UiSVG.CHART_PROGRESS_80;
      } else if (value >= 0.70) {
        assetName = UiSVG.CHART_PROGRESS_70;
      } else if (value >= 0.60) {
        assetName = UiSVG.CHART_PROGRESS_60;
      } else if (value >= 0.50) {
        assetName = UiSVG.CHART_PROGRESS_50;
      } else if (value >= 0.40) {
        assetName = UiSVG.CHART_PROGRESS_40;
      } else if (value >= 0.30) {
        assetName = UiSVG.CHART_PROGRESS_30;
      } else if (value >= 0.20) {
        assetName = UiSVG.CHART_PROGRESS_20;
      } else if (value >= 0.10) {
        assetName = UiSVG.CHART_PROGRESS_10;
      } else if (value <= 0.1) {
        assetName = UiSVG.CHART_PROGRESS;
      }
      return SvgPicture.asset(assetName);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        height: 25,
        width: 71,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 45,
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    '$time',
                    textAlign: TextAlign.center,
                    style: Theme
                        .of(context)
                        .accentTextTheme
                        .display3,
                  ),
                ),
                Container(
                  width: 20,
                  child: Icon(
                    (this.isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                    size: 20,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            Container(
              height: 4,
              padding: EdgeInsets.only(right: 10),
              child: colorCompleted(this.progress),
            ),
          ],
        ),
      ),
    );
  }
}
