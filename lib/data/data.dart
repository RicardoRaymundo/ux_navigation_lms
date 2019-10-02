import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ux_navigation/resource/course/course.dart';

/// A classe Data é responsável pelo carregamento dos dados dos cursos necessários para popular a aplicação
/// Sendo uma classe singleton ela pode ser chamada de qualquer ludar da aplicação
class Data {
  static Data _instance;

  /// Lista de cursos que pode ser acessado de qualquer lugar da aplicação
  /// Data.courses[0].title
  static List<Course> courses = [];
  static List<Course> popular = [];
  static List<Course> available = [];
  static List<Course> banner = [];
  static List<Course> continueWatching = [];
  static List<Course> originals = [];

  /// Lista de nomes de cursos que deve ser carregado
  /// TODO:: Implementar lógica para carregar essa lista diretamente do banco de dados
  static void loadData(next) {
    List<String> listCourses = ['data_literature', 'data_literature', 'data_literature'];

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
      Data.courses.add(value['course']);
      if (value['index'] == (value['len'] as int) - 1) {
        next();
      }

      Data.available = Data.banner = Data.continueWatching = Data.originals = Data.popular = Data.courses;
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
  static Data generate(next) {
    Data.loadData(next);
  }
}
