import 'package:flutter/material.dart';
import 'package:ux_navigation/data/data.dart';
import 'package:ux_navigation/resource/section/section_banner.dart';
import 'package:ux_navigation/resource/section/section_continue_watching.dart';
import 'package:ux_navigation/resource/section/section_originals.dart';
import 'package:ux_navigation/resource/section/section_popular.dart';

class PageHome extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      color: Theme
          .of(context)
          .backgroundColor,
      child: ListView(
        children: <Widget>[
          SectionPopular(title: 'Popular na New School', data: Data.listCoursePopular, parent: this),
          //SectionPopular(title: 'Disponível Agora', data: Data.listCourseAvailable),
          SectionBanner(title: 'Lançamento', data: Data.listCourseBanner),
          SectionContinueWatching(title: 'Continue Assistindo', data: Data.listCourseContinueWatching),
          SectionOriginals(title: 'Originais New School', listCourse: Data.listCourseOriginals)
        ],
      ),
    );
  }
}
