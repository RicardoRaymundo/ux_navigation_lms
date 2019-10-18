import 'package:flutter/material.dart';
import 'package:ux_navigation/ui/ui_custom_icons.dart';

class PageViewed extends StatefulWidget {
  @override
  _PageViewedState createState() => _PageViewedState();
}

class _PageViewedState extends State<PageViewed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 280,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(70.0),
                child: Container(
                  color: Color(0xffb2228c),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Icon(
                      CustomIcons.duplicate,
                      size: 70.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 35.0),
                child: Text(
                  'Os aulas já assistidas ficam aqui.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontFamily: "Montserrat", color: Colors.white70, fontWeight: FontWeight.w400),
                ),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {},
                color: Color(0xffb2228c),
                child: Text('Encontre um curso para estudar.', style: TextStyle(fontSize: 14, color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
