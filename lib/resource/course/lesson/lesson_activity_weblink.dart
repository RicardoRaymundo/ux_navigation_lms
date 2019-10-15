import 'package:ux_navigation/resource/course/lesson/test/test_final.dart';
import 'package:ux_navigation/resource/course/lesson/test/test_placement.dart';

/// a Classe LessonActivityWeblink é responsavel pelas configurações de materiais adicionais como PDF relacionado com o curso
class LessonActivityWeblink {
  String id;
  String title;
  String description;
  String href;
  String timePosition;
  List<TestPlacement> listTestPlacement;
  List<TestFinal> listTestFinal;

  LessonActivityWeblink(Map<String, dynamic> data) {
    this._config(data);
  }

  /// Configura o componete com todos os parâmetros recebidos
  void _config(Map<String, dynamic> data) {
    /// Prepara lista de testes

    List<TestPlacement> listTestPlacementData = [];
    //Verifica se recebeu lista de teste de nivelamento para a atividade
    if (data['test_placement'] != null) {
      int lenTestPlacement = data['test_placement'].length;
      listTestPlacementData = List.generate(lenTestPlacement, (i) {
        return TestPlacement.generate(data['test_placement'][i]);
      });
    }

    List<TestFinal> listTestFinalData = [];
    //Verifica se recebeu lista de teste final para a atividade
    if (data['test_final'] != null) {
      int lenTestFinal = data['test_final'].length;
      listTestFinalData = List.generate(lenTestFinal, (i) {
        return TestFinal.generate(data['test_final'][i]);
      });
    }

    this.id = data['id'];
    this.title = data['title'];
    this.description = data['description'];
    this.href = data['href'];
    this.timePosition = data['time_position'];
    this.listTestPlacement = listTestPlacementData;
    this.listTestFinal = listTestFinalData;
  }

  /// Cria e retorna uma instância do objeto
  factory LessonActivityWeblink.generate(Map<String, dynamic> data) {
    return LessonActivityWeblink(data);
  }
}
