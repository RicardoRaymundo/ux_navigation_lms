import 'package:flutter/material.dart';
import 'package:ux_navigation/page/info/page_info_main.dart';
import 'package:ux_navigation/resource/course/course.dart';
import 'package:ux_navigation/resource/transition/custom_transition_animations.dart';
import 'package:ux_navigation/resource/transition/resource_custom_navigator.dart';

class SectionPopular extends StatefulWidget {
  String title;
  List<Course> data;

  SectionPopular({this.title, this.data});

  @override
  _SectionPopularState createState() => _SectionPopularState();
}

class _SectionPopularState extends State<SectionPopular> {
  @override
  Widget build(BuildContext context) {
    print('DATA POPULAR');
    print(widget.title);

    print('AQUIIIIII');
    print(widget.data);

    return Container(
      padding: EdgeInsets.only(left: 0, right: 0),
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(widget.title),
          ),
          Container(
            height: 200,
            child: ListView(
                padding: EdgeInsets.all(3),
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                children: makeContainers(context)),
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
          height: 200,
          child: GestureDetector(
            onTap: () {
              CustomNavigator.push(context, PageInfoMain(data: widget.data[i]), selectedAnimation);
            },
            child: Image(image: AssetImage("assets/images/" + (i + 1).toString() + ".jpg")),
          )));
    }
    return movieList;
  }
}
