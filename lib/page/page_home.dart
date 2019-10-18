import 'package:flutter/material.dart';
import 'package:ux_navigation/data/data.dart';
import 'package:ux_navigation/resource/banner/banner_home.dart';
import 'package:ux_navigation/resource/course/course.dart';
import 'package:ux_navigation/resource/section/section_banner.dart';
import 'package:ux_navigation/resource/section/section_continue_watching.dart';
import 'package:ux_navigation/resource/section/section_originals.dart';
import 'package:ux_navigation/resource/section/section_popular.dart';

class PageHome extends StatelessWidget {
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

  PageHome({this.course, this.onCourses, this.onMyList, this.onViewed, this.onInfo, this.onPlay});

  Widget build(BuildContext context) {
    return Container(
      color: Theme
          .of(context)
          .backgroundColor,
      child: ListView(
        children: <Widget>[
          BannerHome(
            course: this.course,
            onCourses: this.onCourses,
            onInfo: this.onInfo,
            onMyList: this.onMyList,
            onPlay: this.onPlay,
            onViewed: this.onViewed,
          ),
          SizedBox(height: 30),
          SectionContinueWatching(
            title: 'Continue Assistindo como Israel',
            data: Data.listCourseContinueWatching,
            onPlay: this.onPlay,
            onInfo: this.onInfo,
          ),
          SizedBox(height: 15),
          SectionPopular(
            title: 'Popular na New School',
            data: Data.listCoursePopular,
            onInfo: this.onInfo,
          ),
          SizedBox(height: 15),
          SectionPopular(title: 'Disponível Agora', data: Data.listCourseAvailable),
          SizedBox(height: 15),
          SectionBanner(title: 'Lançamento', data: Data.listCourseBanner),
          SizedBox(height: 15),
          SectionOriginals(
            title: 'Originais New School',
            data: Data.listCoursePopular,
            onInfo: this.onInfo,
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
