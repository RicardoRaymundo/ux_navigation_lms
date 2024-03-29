import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ux_navigation/resource/course/course.dart';

/// A classe Data é responsável pelo carregamento dos dados dos cursos necessários para popular a aplicação
/// Sendo uma classe singleton ela pode ser chamada de qualquer ludar da aplicação
class Data {
  static Data _instance;

  /// Lista de cursos que pode ser acessado de qualquer lugar da aplicação
  /// Data.listCourses[0].title
  static List<Course> listCourse = [];
  static List<Course> listCoursePopular = [];
  static List<Course> listCourseAvailable = [];
  static List<Course> listCourseBanner = [];
  static List<Course> listCourseContinueWatching = [];
  static List<Course> listCourseOriginals = [];

  /// Lista de nomes de cursos que deve ser carregado
  /// TODO:: Implementar lógica para carregar essa lista diretamente do banco de dados
  static void loadData(next) {
    List<String> listCourses = [
      'data_literature',
      'data_math',
      'data_photography',
      'data_pnl',
      'data_future_skills',
      'data_futurism_and_Innovation'
    ];

    /// Carregando os dados do curso
    /// Carrega dados de arquivos json que ficam dentro de assets
    /// TODO:: Implementar lógica para carregar essa lista diretamente do banco de dados
    Future<Map<String, Object>> loadDataSeries(String course, int index, int len) async {
      course = 'assets/data/$course.json';
      String dataRaw = await rootBundle.loadString(course);
      final Map<String, dynamic> data = json.decode(dataRaw);
      return {'course': Course.generate(data), 'index': index, 'len': len};
    }

    /// Ação que deve ser executada quando terminar de carregar os dados
    void callback(Map<String, Object> value) {
      Data.listCourse.add(value['course']);
      if (value['index'] == (value['len'] as int) - 1) {
        next();
      }

      Data.listCourseAvailable =
          Data.listCourseBanner = Data.listCourseContinueWatching = Data.listCourseOriginals = Data.listCoursePopular = Data.listCourse;
    }

    /// Intera a lista de identificadores de cursos para carregar seus respectivos dados
    int len = listCourses.length;
    for (int i = 0; i < len; i++) {
      Future<Map<String, Object>> course = loadDataSeries(listCourses[i], i, len);
      course.then(callback);
    }
  }

  /// Construtor da classe
  factory Data() {
    _instance ??= Data._internalConstructor();
    return _instance;
  }

  Data._internalConstructor();

  /// Inicialiador do loader deve ser executado dentro da classe splashscreen
  static generate(next) {
    Data.loadData(next);
  }
}
