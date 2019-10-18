import 'package:flutter/material.dart';
import 'package:ux_navigation/page/info/video/info_video_page.dart';
import 'package:ux_navigation/resource/chart/chart_marker.dart';

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;

  SlideRightRoute({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return new SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        });
}

class ScaleRoute extends PageRouteBuilder {
  final Widget widget;

  ScaleRoute({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return new ScaleTransition(
            scale: new Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.00,
                  1.00,
                  curve: Curves.linear,
                ),
              ),
            ),
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 1.5,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Interval(
                    0.50,
                    1.00,
                    curve: Curves.linear,
                  ),
                ),
              ),
              child: child,
            ),
          );
        });
}

class ActivitiesHeaderDescription extends StatelessWidget {
  final String description;

  ActivitiesHeaderDescription({this.description});

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 140);

    return IntrinsicHeight(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ChartMarker(
          showMarker: false,
        ),
        Container(
          width: 32,
          height: 40,
        ),
        ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    width: width,
                    child: Text(
                      this.description,
                      style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                      textAlign: TextAlign.left,
                    ),
                  ),
                )
              ],
            )),
        GestureDetector(
          onTap: () {
            print('Open Video');

            Navigator.push(context, SlideRightRoute(widget: InfoVideoPage()));
          },
          child: Container(
            color: Color(0xff000000),
            height: 28,
            width: 78,
            child: Icon(
              Icons.play_circle_filled,
              color: Colors.grey[300],
              size: 30.0,
            ),
          ),
        ),
      ]),
    );
  }
}
