import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/resource/banner/banner_home.dart';
import 'package:ux_navigation/resource/course/course.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class SectionContinueWatching extends StatelessWidget {
  int counter = 0;
  final String title;
  final List<Course> data;

  /// Evento disparado quando clicado no botão Info
  final OnCourseCallback onInfo;

  /// Evento disparado quando clicado no botão Assistir
  final OnCourseCallback onPlay;

  SectionContinueWatching({this.title, this.data, this.onInfo, this.onPlay});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 207,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(padding: EdgeInsets.only(left: 10, bottom: 5, top: 5), child: Text(title, textAlign: TextAlign.left)),
          Container(height: 181, child: generateContinueWatching())
        ],
      ),
    );
  }

  /// Gera lista de telas de cursos
  ListView generateContinueWatching() {
    String courseId = '5da730a6359b52b579f25715_200x286';
    final String assetImage = "assets/images/courses/${courseId}.png";

    List<Container> listConteinerMovie = [];
    int len = this.data.length;
    for (int i = 0; i < len; i++) {
      counter++;

      double leftPadding = 5;
      double rightPadding = 0;

      /// Verifica se está no início da lista
      if (i == 0) {
        /// Dobra o valor do espaçamento da imagem inicial no lado esquerdo
        leftPadding = leftPadding * 2;
      }

      /// Verifica se está no fim da lista
      if (i >= len - 1) {
        /// Define um valor para o espaçamento da imagem final no lado direito
        rightPadding = 10;
      }

      listConteinerMovie.add(Container(
          padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
          child: GestureDetector(
            onTap: () {
              if (i == 1) {}
            },
            child: Column(
              children: <Widget>[
                Container(
                    height: 143,
                    width: 100,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(image: new AssetImage(assetImage), fit: BoxFit.fill),
                    ),
                    child: Tooltip(
                        decoration: BoxDecoration(color: Colors.black87),
                        textStyle: TextStyle(color: Colors.white),
                        preferBelow: true,
                        message: 'Assistir',
                        child: FlatButton(
                          onPressed: () {
                            if (this.onPlay != null) {
                              this.onPlay(this.data[i]);
                            }
                          },
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(0)),
                          padding: EdgeInsets.all(0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 25,
                                width: 60,
                                margin: EdgeInsets.only(bottom: 15),
                                child: SvgPicture.asset(UiSVG.NEW_SCHOOL),
                              ),
                              Container(
                                height: 55,
                                width: 55,
                                child: SvgPicture.asset(UiSVG.PLAY),
                              ),
                            ],
                          ),
                        ))),
                GestureDetector(
                    onTap: () {
                      if (this.onInfo != null) {
                        this.onInfo(this.data[i]);
                      }
                    },
                    child: Container(
                      height: 35,
                      width: 102,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      color: Colors.black87,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            color: Colors.transparent,
                            child: Text(
                              'S1:E' + (i + 1).toString(),
                              style: TextStyle(color: Color(0xffc1c1c1)),
                            ),
                          ),
                          Icon(Icons.info_outline, size: 18, color: Color(0xffc1c1c1))
                        ],
                      ),
                    ))
              ],
            ),
          )));

      if (counter == 12) {
        counter = 0;
      }
    }
    return ListView(
      scrollDirection: Axis.horizontal,
      children: listConteinerMovie,
    );
  }
}
