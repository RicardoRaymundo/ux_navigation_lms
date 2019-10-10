import 'package:flutter/material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson_activity.dart';
import 'package:ux_navigation/resource/expansion_panel/course/expansion_panel_description.dart';
import 'package:ux_navigation/resource/expansion_panel/course/expansion_panel_info_video.dart';

class ExpansionPanelVideoItem extends StatefulWidget {
  final LessonActivity activity;

  ExpansionPanelVideoItem(this.activity);

  @override
  _ExpansionPanelVideoItemState createState() => _ExpansionPanelVideoItemState(activity);
}

class _ExpansionPanelVideoItemState extends State<ExpansionPanelVideoItem> with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  LessonActivity activity;

  _ExpansionPanelVideoItemState(this.activity);

  void _expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2),
      child: AnimatedCrossFade(
        firstChild: Container(
          color: Color(0xff363636),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //GestureDetector(onTap: _expand, child: ExpansionPanelTitle(activity)),
              SizedBox(
                height: 5,
              ),
              //ExpansionPanelDescription(activity),
              SizedBox(
                height: 10,
              ),
              ExpansionPanelInfoVideo(activity),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          // 363636 child: GestureDetector(onTap: _expand, child: ExpansionPanelTitle()),
        ),
        secondChild: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: _expand,
              //child: ExpansionPanelTitle(activity),
            ),
            SizedBox(
              height: 5,
            ),
            ExpansionPanelDescription(
              description: 'ssdsd',
            ),
            SizedBox(
              height: 10,
            ),
            ExpansionPanelInfoVideo(activity),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 330,
                decoration: new BoxDecoration(
                  color: Color(0xff191919),
                  image: new DecorationImage(image: new AssetImage('assets/images/videos.png'), fit: BoxFit.contain),
                )),
          ],
        )),
        crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      ),
    );
  }
}
