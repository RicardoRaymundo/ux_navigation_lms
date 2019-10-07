import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExpansionPanelTitle extends StatelessWidget {
  final String title;
  final int index;
  final double completed;
  final bool isExpanded;

  ExpansionPanelTitle({this.index, this.title, this.completed, this.isExpanded});

  @override
  Widget build(BuildContext context) {
    Color percentCompleted(double value) {
      var color;
      if (value > 0.70) {
        color = Colors.greenAccent;
      } else if (value > 0.35) {
        color = Colors.amberAccent;
      } else if (value < 0.35) {
        color = Colors.redAccent;
      }
      return color;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Theme.of(context).primaryColor, width: 4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Container(
              width: 50,
              height: 50,
              child: CircularPercentIndicator(
                radius: 25.0,
                lineWidth: 3.0,
                percent: this.completed,
                center: Text(
                  (this.index + 1).toString(),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                ),
                progressColor: percentCompleted(this.completed),
                backgroundColor: Color(0xff222222),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(this.title, textAlign: TextAlign.start, style: Theme.of(context).accentTextTheme.title),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            child: Icon(
              (this.isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
              size: 35,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
