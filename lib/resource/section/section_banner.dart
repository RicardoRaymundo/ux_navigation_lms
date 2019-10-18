import 'package:flutter/material.dart';
import 'package:ux_navigation/ui/ui_label.dart';

class SectionBanner extends StatelessWidget {
  final String title;
  final data;

  SectionBanner({this.title, this.data}) : super();

  @override
  Widget build(BuildContext context) {
    String courseId = '5da730a6359b52b579f25715_720x405';
    final String assetImage = "assets/images/courses/${courseId}.png";

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(left: 10, bottom: 10),
            child: Text(this.title),
          ),
          Container(
            child: Image(
              image: new AssetImage(assetImage),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 4, bottom: 4),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                FlatButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                  padding: EdgeInsets.only(top: 2, bottom: 2, left: 30, right: 37),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.play_arrow, color: Colors.black),
                      SizedBox(width: 5),
                      Text(
                        UILabel.WATCH,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  onPressed: () {
                    /*if (this.onPlay != null) {
                      this.onPlay(this.courseId);
                    }*/
                  },
                ),
                FlatButton(
                  color: Color(0xffb2208c),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                  padding: EdgeInsets.only(top: 2, bottom: 2, left: 20, right: 30),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add,
                        color: Colors.white,),
                      SizedBox(width: 5),
                      Text(
                        'Minha Lista',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: () {
                    /*if (this.onPlay != null) {
                      this.onPlay(this.courseId);
                    }*/
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
