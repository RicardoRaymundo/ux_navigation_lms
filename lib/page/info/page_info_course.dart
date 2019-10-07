import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/resource/course/course.dart';
import 'package:ux_navigation/resource/course/lesson/lesson.dart';
import 'package:ux_navigation/resource/course/lesson/lesson_activity.dart';
import 'package:ux_navigation/resource/expansion_panel/expansion_panel_lesson_list.dart';
import 'package:ux_navigation/resource/util.dart';
import 'package:ux_navigation/ui/ui_label.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class PageInfoCourse extends StatelessWidget {
  final Course data;

  PageInfoCourse({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 220,
                    decoration: new BoxDecoration(
                      //image: new DecorationImage(image: AssetImage('${UiImage.PATH}/${widget.data.id}'), fit: BoxFit.fill),
                    ),
                    child: FlatButton(
                        onPressed: () {
                          // CustomNavigator.showPlayer(context, Player());
                        },
                        child: Center(
                          child: Container(
                            height: 60,
                            width: 60,
                            child: SvgPicture.asset(UiSVG.PLAY),
                          ),
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 50,
                      // Add box decoration
                      decoration: BoxDecoration(
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          stops: [0.1, 1.0],
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.transparent,
                            Color(0xff2e2e2e),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// Botão Voltar
                  Positioned(
                      top: 30,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(child: Icon(Icons.arrow_back, size: 26)),
                      )),

                  /// Botão ChromeCast
                  Positioned(
                      top: 30,
                      right: 15,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(child: Icon(Icons.cast, size: 26)),
                      ))
                ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                /// Titulo do curso
                Text(this.data.title, style: Theme
                    .of(context)
                    .primaryTextTheme
                    .title),
                SizedBox(height: 10),

                /// Informações geral do curso Ano/Author/Lições/Tempo de Duração
                Text(
                  "${this.data.year}   ${this.data.author}   ${this.data.lessons.length.toString()} ${UILabel.LESSONS}   ${this._time()}",
                  style: Theme
                      .of(context)
                      .accentTextTheme
                      .display2,
                ),
                SizedBox(height: 15),

                /// Descrição do curso
                Text(this.data.description, style: Theme
                    .of(context)
                    .primaryTextTheme
                    .body1),
                SizedBox(height: 15),
              ],
            ),
          ),
              ExpansionPanelLessonList(this.data.lessons),
              SizedBox(height: 20)
        ],
      ),
        ));
  }

  /// Cálcula o tempo total dos vídeos na lição
  String _time() {
    String result = '00:00';
    for (Lesson lesson in this.data.lessons) {
      lesson.activities.forEach((LessonActivity item) {
        result = Util.calculateTime(result, item.duration);
      });
    }
    return result;
  }
}
