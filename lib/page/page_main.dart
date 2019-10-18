import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ux_navigation/data/data.dart';
import 'package:ux_navigation/page/page_courses.dart';
import 'package:ux_navigation/page/page_downloads.dart';
import 'package:ux_navigation/page/page_gallery.dart';
import 'package:ux_navigation/page/page_home.dart';
import 'package:ux_navigation/page/page_loader.dart';
import 'package:ux_navigation/page/page_more.dart';
import 'package:ux_navigation/page/page_mylist.dart';
import 'package:ux_navigation/page/page_search.dart';
import 'package:ux_navigation/page/page_viewed.dart';
import 'package:ux_navigation/resource/banner/banner_home.dart';
import 'package:ux_navigation/resource/course/course.dart';
import 'package:ux_navigation/resource/custom_fab/fab_bottom_app_bar.dart';
import 'package:ux_navigation/resource/section/section_popular.dart';
import 'package:ux_navigation/ui/ui_custom_icons.dart';

class PageMain extends StatefulWidget {
  /// Identificador do curso que deve ser visualizado no banner
  String courseId = '5da730a6359b52b579f25715_1220x1476';

  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> with SingleTickerProviderStateMixin {
  int currentTabIndex = 0;
  bool isLogged = true;
  List<int> listPageNumber = [0];

  /// Evento disparado quando clicado no botão Cursos
  OnCallback onCourses() {
    print('ON COURSES');
    setState(() {
      this._selectedTab(4);
    });
  }

  /// Evento disparado quando clicado no botão Minha Lista
  OnCallback onMyList() {
    print('ON LIST');
    setState(() {
      this._selectedTab(5);
    });
  }

  /// Evento disparado quando clicado no botão Aulas
  OnCallback onViewed() {
    print('ON VIEW');
    setState(() {
      this._selectedTab(6);
    });
  }

  /// Evento disparado quando clicado no botão Info
  OnCourseCallback onInfo(Course course) {
    print('ON INFO');
    print(course.id);
    Navigator.push(context, SlideLeftRoute(enterWidget: PageLoader(data: course)));
  }

  /// Evento disparado quando clicado no botão Assistir
  OnCourseCallback onPlay(Course course) {
    print('ON PLAY');
    print(course.id);
  }

  /// Reconfigura as configurações de UI Overlay
  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  /// Método que altera o valor de index da battombar, quando um de seus filhos
  /// é clicado
  void _selectedTab(int index) {
    setState(() {
      currentTabIndex = index;

      //Verifica se o último indice é diferente do indice atual que deve ser adicionado na lista
      if (this.listPageNumber.length > 0 && this.listPageNumber.last != index) {
        this.listPageNumber.add(this.currentTabIndex);
      } else {
        this.listPageNumber.add(this.currentTabIndex);
      }
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Listas de Widgets que a bottombar exibirá. Tanto pelos filhos do botao central, quanto
    /// os filhos da bottombar
    final List<Widget> listPage = [
      PageHome(
        course: Data.listCourse[2],
        onCourses: this.onCourses,
        onInfo: this.onInfo,
        onMyList: this.onMyList,
        onPlay: this.onPlay,
        onViewed: this.onViewed,
      ),
      PageSearch(),
      PageDownloads(),
      PageMore(),
      PagesCourses(),
      PageMyList(),
      PageViewed(),
      PageGallery()
    ];

    return Opacity(
      opacity:

      /// Verifica a orientação do celular, certificando-se de que seja
      /// mantida a orientação portrait
      MediaQuery.of(context).orientation == Orientation.portrait ? 1 : 0,
      child: WillPopScope(
        onWillPop: () {
          this.listPageNumber.removeLast();
          if (this.listPageNumber.length >= 1) {
            int lastPage = this.listPageNumber.last;
            this._selectedTab(lastPage);
            this.listPageNumber.removeLast();
          } else {
            exit(0);
          }
          return new Future.value(false);
        },
        child: Scaffold(

          /// Widget que será exibido atravez da seleção da bottombar
          body: listPage[currentTabIndex],
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffb2208c),

            ///Seleciona a tela de galeria
            onPressed: () {
              setState(() {
                this._selectedTab(7);
              });
            },
            child: Icon(CustomIcons.trophy),
            elevation: 0,
          ),
          bottomNavigationBar: FABBottomAppBar(
            backgroundColor: Color(0xff222222),
            iconSize: 20,
            centerItemText: 'Galeria',
            color: Colors.white54,
            selectedColor: Colors.white,
            notchedShape: CircularNotchedRectangle(),
            onTabSelected: this._selectedTab,
            items: [
              FABBottomAppBarItem(iconData: CustomIcons.download, text: 'Início'),
              FABBottomAppBarItem(iconData: CustomIcons.loupe, text: 'Buscas'),
              FABBottomAppBarItem(iconData: CustomIcons.download, text: 'Downloads'),
              FABBottomAppBarItem(iconData: CustomIcons.menu, text: 'Mais'),
            ],
          ),
        ),
      ),
    );
  }
}
