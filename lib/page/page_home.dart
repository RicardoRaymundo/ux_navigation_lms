import 'package:flutter/material.dart';
import 'package:ux_navigation/data/data.dart';
import 'package:ux_navigation/resource/section/section_banner.dart';
import 'package:ux_navigation/resource/section/section_continue_watching.dart';
import 'package:ux_navigation/resource/section/section_originals.dart';
import 'package:ux_navigation/resource/section/section_popular.dart';

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SectionPopular(title: 'Popular na New School', data: Data.popular),
        SectionPopular(title: 'Disponível Agora', data: Data.available),
        SectionBanner(title: 'Lançamento', data: Data.banner),
        SectionContinueWatching(title: 'Continue Assistindo', data: Data.continueWatching),
        SectionOriginals(title: 'Originais New School', data: Data.originals)
      ],
    );
  }
}
