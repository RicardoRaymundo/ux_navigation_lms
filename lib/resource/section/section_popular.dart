import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/resource/banner/banner_home.dart';
import 'package:ux_navigation/resource/course/course.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class SlideLeftRoute extends PageRouteBuilder {
  final Widget enterWidget;
  final Widget oldWidget;

  SlideLeftRoute({this.enterWidget, this.oldWidget})
      : super(
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return enterWidget;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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

class SectionPopular extends StatelessWidget {
  int counter = 0;
  final String title;
  final List<Course> data;

  /// Evento disparado quando clicado no botão Info
  final OnCourseCallback onInfo;

  SectionPopular({this.title, this.data, this.onInfo});

  @override
  Widget build(BuildContext context) {
    String courseId = '5da730a6359b52b579f25715';
    final String assetImage = "assets/images/courses/${courseId}_424x606.png";

    print('DATA');
    print(data);

    List<Container> listConteinerMovie = [];
    int len = this.data.length;
    print('length');
    print(len);
    for (int i = 0; i < len; i++) {
      print(this.data[i].title);
      print(this.data[i].id);

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
                    height: 150,
                    width: 105,
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
    }

    return Container(
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(padding: EdgeInsets.only(left: 10, bottom: 5, top: 5), child: Text(title, textAlign: TextAlign.left)),
          Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: listConteinerMovie,
              ))
        ],
      ),
    );
  }
}
/*
class _SectionPopularState extends State<SectionPopular> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(widget.title),
          ),
          Container(
            height: 180,
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
        color: Colors.deepOrange,
          padding: EdgeInsets.all(5),
          width: 150,
          child: GestureDetector(
            onTap: () async {
              PageInfoMain pageInfoMain = await createOrderMessage(widget.data[i]);
              Navigator.push(context, SlideLeftRoute(enterWidget: PageLoader(data: widget.data[i]), oldWidget: parent));
            },
            child: Image(image: AssetImage("assets/images/" + (i + 1).toString() + ".jpg"), fit: BoxFit.fill,),
          )));
    }
    return movieList;
  }
}*/
