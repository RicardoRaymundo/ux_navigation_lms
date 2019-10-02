import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ux_navigation/app/app_button_enable.dart';
import 'package:ux_navigation/app/app_routing.dart';
import 'package:ux_navigation/resource/course/course.dart';

class PageInfoCourse extends StatefulWidget {
  Course data;

  PageInfoCourse({this.data});

  @override
  _PageInfoCourseState createState() => _PageInfoCourseState();
}

class _PageInfoCourseState extends State<PageInfoCourse> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 180,
            child: Material(
              color: Colors.purple,
              child: InkWell(
                onTap: () {
                  AppButtonEnable.pagesInfoMain = false;
                  Navigator.pushNamed(context, AppRouting.PAGE_INFO_VIDEO);
                },
                child: Center(
                  child: Text('Vídeo introdutório do curso'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.data.title,
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 15),
                  Text(widget.data.description),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ExpansionPanelList(
              /// Cria uma lista de Expanion Panel
              animationDuration: Duration(seconds: 1),
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  ///Alterna o estado do ExpansionPanel
                  return _isExpanded = !_isExpanded;
                });
              },
              children: <ExpansionPanel>[
                _buildExpansionPanel(),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Método que cria cada ExpansionPanel
  ExpansionPanel _buildExpansionPanel() {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Row(
            children: <Widget>[
              Icon(Icons.trip_origin),
              SizedBox(
                width: 10,
              ),
              Text('Título da atividade'),
            ],
          ),
        );
      },
      body: ListTile(
        title: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
          ' Sed eu tincidunt orci. Integer a posuere massa. Aliquam finibus felis tortor, et volutpat dolor lacinia quis.'
          'Curabitur aliquet in ex eu lacinia. Sed non quam nisl. Aliquam blandit mi vel odio tempor convallis fermentum nec lorem.',
        ),
        subtitle: Text('To delete this panel, tap the trash can icon'),
      ),
      isExpanded: this._isExpanded,
    );
  }
}
