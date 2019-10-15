import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class ChartMarker extends StatelessWidget {
  final double progress;
  final bool showMarker;

  ChartMarker({this.progress = 0.0, this.showMarker = true});

  @override
  Widget build(BuildContext context) {
    String percentage = (this.progress * 100).floor().toString();

    SvgPicture colorCompleted(double value) {
      String assetName = UiSVG.CHART_MARKER;
      if (value >= 1.0) {
        assetName = UiSVG.CHART_MARKER_GREEN;
      } else if (value >= 0.90) {
        assetName = UiSVG.CHART_MARKER_BLUE;
      } else if (value >= 0.80) {
        assetName = UiSVG.CHART_MARKER_BLUE;
      } else if (value >= 0.70) {
        assetName = UiSVG.CHART_MARKER_BLUE;
      } else if (value >= 0.60) {
        assetName = UiSVG.CHART_MARKER_YELLOW;
      } else if (value >= 0.50) {
        assetName = UiSVG.CHART_MARKER_YELLOW;
      } else if (value >= 0.40) {
        assetName = UiSVG.CHART_MARKER_YELLOW;
      } else if (value >= 0.30) {
        assetName = UiSVG.CHART_MARKER_RED;
      } else if (value >= 0.20) {
        assetName = UiSVG.CHART_MARKER_RED;
      } else if (value >= 0.10) {
        assetName = UiSVG.CHART_MARKER_RED;
      } else if (value <= 0.1) {
        assetName = UiSVG.CHART_MARKER;
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
          this.showMarker ? Container(width: 30, child: SvgPicture.asset(UiSVG.CHART_MARKER_GREEN)) : Container(width: 30),
        ],
      ),
    );
  }
}
