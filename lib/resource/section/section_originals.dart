import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/resource/banner/banner_home.dart';
import 'package:ux_navigation/resource/course/course.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class SectionOriginals extends StatelessWidget {
  int counter = 0;
  final String title;
  final List<Course> data;

  /// Evento disparado quando clicado no botão Info
  final OnCourseCallback onInfo;

  SectionOriginals({this.title, this.data, this.onInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      //color: Colors.lime,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(padding: EdgeInsets.only(left: 10, bottom: 5, top: 5), child: Text(title, textAlign: TextAlign.left)),
          Container(height: 280, child: generateContinueWatching())
        ],
      ),
    );
  }

  /// Gera lista de telas de cursos
  ListView generateContinueWatching() {
    String courseId = '5da730a6359b52b579f25715_308x616';
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
            child: Stack(
              children: <Widget>[
                Container(
                    height: 300,
                    width: 150,
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
                            if (this.onInfo != null) {
                              this.onInfo(this.data[i]);
                            }
                          },
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(0)),
                          padding: EdgeInsets.all(0),
                          child: Container(),
                        ))),
                Positioned(
                  left: 5,
                  top: 5,
                  child: Container(
                    height: 25,
                    width: 25,
                    margin: EdgeInsets.only(bottom: 15),
                    child: SvgPicture.asset(UiSVG.ICON_NEW_SCHOOL),
                  ),
                )
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

/*class _SectionOriginalsState extends State<SectionOriginals> {
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
              children: generateSectionOriginals(context),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> generateSectionOriginals(context) {
    Function selectedAnimation = CustomTransitionAnimations.slideTransitionLeft;

    List<Widget> listWidgetMovie = [];
    int len = widget.listCourse.length;
    for (int i = 0; i < len; i++) {
      listWidgetMovie.add(Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(right: 10, top: 10),
          width: 200,
          child: GestureDetector(
            onTap: () {
            },
            child: Image(
              image: AssetImage("assets/images/" + (i + 1).toString() + ".jpg"),
              fit: BoxFit.fitHeight,
            ),
          )));
    }
    return listWidgetMovie;
  }
}*/
