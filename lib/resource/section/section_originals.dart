import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ux_navigation/page/info/page_info_main.dart';
import 'package:ux_navigation/resource/course/course.dart';
import 'package:ux_navigation/resource/transition/custom_transition_animations.dart';
import 'package:ux_navigation/resource/transition/resource_custom_navigator.dart';

class SectionOriginals extends StatefulWidget {
  String title;
  List<Course> data;

  SectionOriginals({this.title, this.data}) : super();

  @override
  _SectionOriginalsState createState() => _SectionOriginalsState();
}

class _SectionOriginalsState extends State<SectionOriginals> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 10),
      height: 400,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Text(widget.title),
            ]),
          ),
          Container(
            height: 350,
            child: ListView(
              padding: EdgeInsets.only(right: 6),
              scrollDirection: Axis.horizontal,
              children: makeContainers(context),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> makeContainers(context) {
    Function selectedAnimation = CustomTransitionAnimations.slideTransitionLeft;

    List<Container> movieList = [];
    int len = widget.data.length;
    for (int i = 0; i < len; i++) {
      movieList.add(Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(right: 10, top: 10),
          width: 200,
          child: GestureDetector(
            onTap: () {
              CustomNavigator.push(context, PageInfoMain(data: widget.data[i]), selectedAnimation);
            },
            child: Image(
              image: AssetImage("assets/images/" + (i + 1).toString() + ".jpg"),
              fit: BoxFit.fitHeight,
            ),
          )));
    }
    return movieList;
  }
}
