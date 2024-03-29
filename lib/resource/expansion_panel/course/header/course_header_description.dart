import 'package:flutter/material.dart';

class CourseHeaderDescription extends StatelessWidget {
  final String description;

  CourseHeaderDescription({this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 20),
          Expanded(
            child: Text(
              this.description,
              maxLines: 5,
              textAlign: TextAlign.left,
              style: Theme.of(context).accentTextTheme.display2,
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
