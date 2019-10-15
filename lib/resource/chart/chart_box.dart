import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class ChartBox extends StatelessWidget {
  final double progress;

  ChartBox({this.progress = 0.0});

  @override
  Widget build(BuildContext context) {
    String percentage = (this.progress * 100).floor().toString();

    SvgPicture colorCompleted(double value) {
      String assetName = UiSVG.CHART_BOX;
      if (value >= 1.0) {
        assetName = UiSVG.CHART_BOX_100;
      } else if (value >= 0.90) {
        assetName = UiSVG.CHART_BOX_90;
      } else if (value >= 0.80) {
        assetName = UiSVG.CHART_BOX_80;
      } else if (value >= 0.70) {
        assetName = UiSVG.CHART_BOX_70;
      } else if (value >= 0.60) {
        assetName = UiSVG.CHART_BOX_60;
      } else if (value >= 0.50) {
        assetName = UiSVG.CHART_BOX_50;
      } else if (value >= 0.40) {
        assetName = UiSVG.CHART_BOX_40;
      } else if (value >= 0.30) {
        assetName = UiSVG.CHART_BOX_30;
      } else if (value >= 0.20) {
        assetName = UiSVG.CHART_BOX_20;
      } else if (value >= 0.10) {
        assetName = UiSVG.CHART_BOX_10;
      } else if (value <= 0.1) {
        assetName = UiSVG.CHART_BOX;
      }
      return SvgPicture.asset(assetName);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 28,
        width: 70,
        child: Row(
          children: <Widget>[
            Container(
              width: 20,
              height: 20,
              child: colorCompleted(this.progress),
            ),
            Container(
              width: 35,
              height: 30,
              padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
              child: Text(
                '$percentage%',
                textAlign: TextAlign.right,
                style: Theme.of(context).accentTextTheme.display3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
