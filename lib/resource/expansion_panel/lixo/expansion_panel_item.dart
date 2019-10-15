import 'package:flutter/material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson.dart';

class ExpansionPanelItem extends StatefulWidget {
  final Lesson activity;

  ExpansionPanelItem(this.activity);

  @override
  _ExpansionPanelItemState createState() => _ExpansionPanelItemState(activity);
}

class _ExpansionPanelItemState extends State<ExpansionPanelItem> with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  Lesson activity;

  _ExpansionPanelItemState(this.activity);

  void _expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.activity.title),
    );
    /*return Padding(
      padding: EdgeInsets.only(bottom: 2),
      child: AnimatedCrossFade(
        firstChild: Container(
          color: Color(0xff363636),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(onTap: _expand, child: CourseHeaderTitle(activity)),
              SizedBox(
                height: 5,
              ),
              CourseHeaderDescription(activity),
              SizedBox(
                height: 10,
              ),
              CourseHeaderInfo(activity),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          // 363636 child: GestureDetector(onTap: _expand, child: CourseHeaderTitle()),
        ),
        secondChild: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: _expand,
                  child: CourseHeaderTitle(activity),
                ),
                SizedBox(
                  height: 5,
                ),
                CourseHeaderDescription(activity),
                SizedBox(
                  height: 10,
                ),
                CourseHeaderInfo(activity),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Color(0xff191919),
                  child: SizedBox(
                    height: 275,
                    child: SvgPicture.asset(
                      'assets/svg/chart.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            )),
        crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      ),
    );*/
  }
}
