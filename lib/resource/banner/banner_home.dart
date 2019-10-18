import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/resource/course/course.dart';
import 'package:ux_navigation/ui/ui_label.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

typedef OnCallback = void Function();
typedef OnCourseCallback = void Function(Course course);

class BannerHome extends StatelessWidget {
  /// Objeto de dados do curso
  final Course course;

  /// Evento disparado quando clicado no botão Cursos
  final OnCallback onCourses;

  /// Evento disparado quando clicado no botão Minha Lista
  final OnCallback onMyList;

  /// Evento disparado quando clicado no botão Aulas
  final OnCallback onViewed;

  /// Evento disparado quando clicado no botão Info
  final OnCourseCallback onInfo;

  /// Evento disparado quando clicado no botão Assistir
  final OnCourseCallback onPlay;

  BannerHome({this.course, this.onCourses, this.onMyList, this.onViewed, this.onInfo, this.onPlay});

  @override
  Widget build(BuildContext context) {
    final String assetImage = "assets/images/courses/${this.course.id}_1220x1476.png";
    return Container(
      height: 550,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage(assetImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          generateTopButtons(context),
          generateBaseButtons(context),
        ],
      ),
    );
  }

  /// Gera a lista de botões do topo do banner
  Widget generateTopButtons(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(top: 10, left: 15, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5),
            height: 50,
            width: 50,
            child: SvgPicture.asset(UiSVG.APP_LOGO),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              if (this.onCourses != null) {
                this.onCourses();
              }
            },
            child: Container(
              color: Colors.transparent,
              height: 50,
              padding: EdgeInsets.all(10),
              child: Text(UILabel.COURSES),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (this.onViewed != null) {
                this.onViewed();
              }
            },
            child: Container(
              color: Colors.transparent,
              height: 50,
              padding: EdgeInsets.all(10),
              child: Text(UILabel.CLASSES),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (this.onMyList != null) {
                this.onMyList();
              }
            },
            child: Container(
              color: Colors.transparent,
              height: 50,
              padding: EdgeInsets.all(10),
              child: Text(UILabel.MY_LIST),
            ),
          ),
        ],
      ),
    );
  }

  /// Gera a lista de botões da base do banner
  Widget generateBaseButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (this.onMyList != null) {
                this.onMyList();
              }
            },
            child: Container(
              color: Colors.transparent,
              width: 70,
              child: Column(
                children: <Widget>[
                  Icon(Icons.add, color: Colors.white, size: 25),
                  Text(
                    UILabel.MY_LIST,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
          FlatButton(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
            padding: EdgeInsets.only(top: 2, bottom: 2, left: 10, right: 15),
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
              if (this.onPlay != null) {
                this.onPlay(this.course);
              }
            },
          ),
          GestureDetector(
            onTap: () {
              if (this.onInfo != null) {
                this.onInfo(this.course);
              }
            },
            child: Container(
              color: Colors.transparent,
              width: 70,
              child: Column(
                children: <Widget>[
                  Icon(Icons.info_outline, color: Colors.white, size: 25),
                  SizedBox(height: 1),
                  Text(
                    UILabel.INFO,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
