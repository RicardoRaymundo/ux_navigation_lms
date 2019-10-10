import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/ui/ui_label.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class ExpansionPanelInfo extends StatelessWidget {
  final int index;
  final int total;
  final String time;
  final double performance;
  final int badge;

  ExpansionPanelInfo({this.index, this.total, this.time, this.performance = 0, this.badge = 0});

  @override
  Widget build(BuildContext context) {
    String pathSvg = UiSVG.METRIC;
    final String assetName = 'assets/svg/medalha' + this.badge.toString() + '.svg';

    SvgPicture setMetric(double value) {
      if (value > 0.7) {
        pathSvg = UiSVG.METRIC_SUCCESS;
      } else if (value > 0.35) {
        pathSvg = UiSVG.METRIC_MEDIO;
      } else if (value > 1 && value < 0.35) {
        pathSvg = UiSVG.METRIC_FAIL;
      }
      return SvgPicture.asset(pathSvg);
    }

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 20),
          SizedBox(width: 17, height: 17, child: SvgPicture.asset(UiSVG.INFO_CHECK)),
          SizedBox(width: 5),
          Text((this.index + 1).toString() + ' ${UILabel.OF} ' + this.total.toString(),
              textAlign: TextAlign.left, style: Theme.of(context).accentTextTheme.display1),
          SizedBox(width: 10),
          SizedBox(width: 17, height: 17, child: SvgPicture.asset(UiSVG.INFO_TIME)),
          SizedBox(width: 5),
          Text(this.time.toString(), textAlign: TextAlign.left, style: Theme.of(context).accentTextTheme.display1),
          Spacer(),
          SizedBox(width: 22, height: 22, child: setMetric(this.performance)),
          SizedBox(width: 5),
          Text((this.performance * 100).floor().toString() + "%",
              textAlign: TextAlign.left, style: Theme.of(context).accentTextTheme.display1),
          SizedBox(width: 10),
          SizedBox(
            width: 28,
            height: 28,
            child: this.badge > 0 ? SvgPicture.asset(assetName) : Container(),
          ),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}
