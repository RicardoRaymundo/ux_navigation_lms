import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class ChartMarkerFinal extends StatelessWidget {
  final double progress;

  ChartMarkerFinal({this.progress = 0.0});

  @override
  Widget build(BuildContext context) {
    String percentage = (this.progress * 100).floor().toString();

    SvgPicture colorCompleted(double value) {
      String assetName = UiSVG.CHART_MARKER_FINAL;
      if (value >= 1.0) {
        assetName = UiSVG.CHART_MARKER_GREEN_FINAL;
      } else if (value >= 0.90) {
        assetName = UiSVG.CHART_MARKER_BLUE_FINAL;
      } else if (value >= 0.80) {
        assetName = UiSVG.CHART_MARKER_BLUE_FINAL;
      } else if (value >= 0.70) {
        assetName = UiSVG.CHART_MARKER_BLUE_FINAL;
      } else if (value >= 0.60) {
        assetName = UiSVG.CHART_MARKER_YELLOW_FINAL;
      } else if (value >= 0.50) {
        assetName = UiSVG.CHART_MARKER_YELLOW_FINAL;
      } else if (value >= 0.40) {
        assetName = UiSVG.CHART_MARKER_YELLOW_FINAL;
      } else if (value >= 0.30) {
        assetName = UiSVG.CHART_MARKER_RED_FINAL;
      } else if (value >= 0.20) {
        assetName = UiSVG.CHART_MARKER_RED_FINAL;
      } else if (value >= 0.10) {
        assetName = UiSVG.CHART_MARKER_RED_FINAL;
      } else if (value <= 0.1) {
        assetName = UiSVG.CHART_MARKER_FINAL;
      }
      return SvgPicture.asset(assetName);
    }

    return Container(
      width: 30,
      height: 35,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: colorCompleted(this.progress),
    );
  }
}
