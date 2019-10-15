import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/resource/course/lesson/lesson_activity.dart';

class CourseHeaderInfoVideo extends StatefulWidget {
  final LessonActivity activity;

  CourseHeaderInfoVideo(this.activity);

  @override
  _CourseHeaderInfoVideoState createState() => _CourseHeaderInfoVideoState(activity);
}

class _CourseHeaderInfoVideoState extends State<CourseHeaderInfoVideo> {
  LessonActivity activity;

  _CourseHeaderInfoVideoState(this.activity);

  @override
  Widget build(BuildContext context) {
    //String assetName = 'assets/svg/metric.svg';

    /*SvgPicture setMetric(int value) {
      if (value > 70) {
        assetName = 'assets/svg/metric-success.svg';
      } else if (value > 35) {
        assetName = 'assets/svg/metric-medio.svg';
      } else if (value > 1 && value < 35) {
        assetName = 'assets/svg/metric-fail.svg';
      }
      print('assetName');
      print(value);
      print(assetName);

      return SvgPicture.asset(assetName);
    }*/

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(width: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: 17,
                height: 17,
                child: SvgPicture.asset('assets/svg/info-time.svg'),
              ),
              SizedBox(
                width: 5,
              ),
              Center(
                child: Text(activity.duration,
                    maxLines: 5,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Montserrat",
                      color: Colors.white54,
                      fontWeight: FontWeight.normal,
                    )),
              ),
              SizedBox(
                width: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
