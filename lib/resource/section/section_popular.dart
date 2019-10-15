import 'package:flutter/material.dart';
import 'package:ux_navigation/page/info/page_info_course.dart';
import 'package:ux_navigation/page/info/page_info_main.dart';
import 'package:ux_navigation/page/page_loader.dart';
import 'package:ux_navigation/resource/course/course.dart';
import 'package:ux_navigation/resource/expansion_panel/course/activities/header/activities_header_description.dart';
import 'package:ux_navigation/resource/transition/custom_transition_animations.dart';
import 'package:ux_navigation/resource/transition/resource_custom_navigator.dart';

class SlideLeftRoute extends PageRouteBuilder {
  final Widget enterWidget;
  final Widget oldWidget;

  SlideLeftRoute({this.enterWidget, this.oldWidget})
      : super(
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return enterWidget;
      },
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) {
        return Stack(
          children: <Widget>[
            SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                child: oldWidget),
            SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: enterWidget)
          ],
        );
      });
}


class SectionPopular extends StatefulWidget {
  final String title;
  final List<Course> data;
  final parent;

  SectionPopular({this.title, this.data, this.parent});

  @override
  _SectionPopularState createState() => _SectionPopularState();
}

class _SectionPopularState extends State<SectionPopular> {
  @override
  Widget build(BuildContext context) {
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
                children: makeContainers(context, widget.parent)),
          )
        ],
      ),
    );
  }

  List<Widget> makeContainers(data, parent) {
    // Asynchronous
    Future<PageInfoMain> createOrderMessage(data) async {
      return await PageInfoMain(data: data);
    }

    List<Container> movieList = [];
    int len = widget.data.length;
    for (int i = 0; i < len; i++) {
      movieList.add(Container(
          padding: EdgeInsets.all(5),
          height: 200,
          child: GestureDetector(
            onTap: () async {
              PageInfoMain pageInfoMain = await createOrderMessage(widget.data[i]);
              print('Fetching user order...');

              //CustomNavigator.push(context, PageInfoMain(data: widget.data[i]), CustomTransitionAnimations.slideTransitionLeft);
              //Navigator.push(context, SlideRightRoute(widget: PageInfoCourse(data: widget.data[i])));
              //Navigator.push(context, SlideRightRoute(widget: PageLoader()));
              //CustomNavigator.push(context, PageLoader(data: widget.data[i],), CustomTransitionAnimations.slideTransitionLeft);
              Navigator.push(context, SlideLeftRoute(enterWidget: PageLoader(data: widget.data[i]), oldWidget: parent));
            },
            child: Image(image: AssetImage("assets/images/" + (i + 1).toString() + ".jpg")),
          )));
    }
    return movieList;
  }
}
