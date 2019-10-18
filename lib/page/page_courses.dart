import 'package:flutter/material.dart';
import 'package:ux_navigation/resource/search/search_bar.dart';

class PagesCourses extends StatefulWidget {
  @override
  _PagesCoursesState createState() => _PagesCoursesState();
}

class _PagesCoursesState extends State<PagesCourses> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SearchBar(),
        elevation: 0,
      ),
      body: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: GridView.builder(
            itemCount: 11,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: (MediaQuery.of(context).size.width) / (MediaQuery.of(context).size.height - 100),
            ),
            itemBuilder: (BuildContext context, int index) {
              return new GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      image: DecorationImage(
                        image: AssetImage("assets/images/" + (index + 1).toString() + ".jpg"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                onTap: () {},
              );
            }),
      ),
    );
  }
}
