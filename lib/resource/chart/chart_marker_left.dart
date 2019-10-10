import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class ChartMarkerLeft extends StatelessWidget {
  final double progress;

  ChartMarkerLeft({this.progress = 0.0});

  @override
  Widget build(BuildContext context) {
    String percentage = (this.progress * 100).floor().toString();

    SvgPicture colorCompleted(double value) {
      String assetName = UiSVG.CHART_MARKER_LEFT;
      if (value >= 1.0) {
        assetName = UiSVG.CHART_MARKER_LEFT;
      } else if (value >= 0.90) {
        assetName = UiSVG.CHART_MARKER_LEFT;
      } else if (value >= 0.80) {
        assetName = UiSVG.CHART_MARKER_LEFT;
      } else if (value >= 0.70) {
        assetName = UiSVG.CHART_MARKER_LEFT;
      } else if (value >= 0.60) {
        assetName = UiSVG.CHART_MARKER_LEFT;
      } else if (value >= 0.50) {
        assetName = UiSVG.CHART_MARKER_LEFT;
      } else if (value >= 0.40) {
        assetName = UiSVG.CHART_MARKER_LEFT;
      } else if (value >= 0.30) {
        assetName = UiSVG.CHART_MARKER_LEFT;
      } else if (value >= 0.20) {
        assetName = UiSVG.CHART_MARKER_LEFT;
      } else if (value >= 0.10) {
        assetName = UiSVG.CHART_MARKER_LEFT;
      } else if (value <= 0.1) {
        assetName = UiSVG.CHART_MARKER_LEFT;
      }
      return SvgPicture.asset(assetName);
    }

    return Expanded(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Container(
            color: Color(0xff363636),
            width: 4,
          ),
          Container(
            width: 30,
            child: SvgPicture.asset(UiSVG.CHART_MARKER_GREEN),
          ),
        ],
      ),
    );

    /*return Container(
      width: 56,
      height: 35,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: colorCompleted(this.progress),
    );*/
  }
}
