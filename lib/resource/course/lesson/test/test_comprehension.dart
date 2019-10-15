import 'package:ux_navigation/resource/course/lesson/test/test_alternative.dart';

class TestComprehension {
  String id;
  String title;
  String correct;
  int score;
  String timePosition;

  List<TestAlternative> listAlternatives;

  TestComprehension(Map<String, dynamic> data) {
    this._config(data);
  }

  void _config(Map<String, dynamic> data) {
    List<TestAlternative> listAlternativesData = [];

    //Verifica se recebeu lista de arternativas para registrar no teste de compreensão
    if (data['alternatives'] != null) {
      int lenAlternatives = data['alternatives'].length;
      listAlternativesData = List.generate(lenAlternatives, (i) {
        return TestAlternative.generate(data['alternatives'][i]);
      });
    }

    this.id = data['id'];
    this.title = data['title'];
    this.correct = data['correct'];
    this.score = data['score'] as int;
    this.timePosition = data['time_position'];
    this.listAlternatives = listAlternativesData;
  }

  factory TestComprehension.generate(Map<String, dynamic> data) {
    return TestComprehension(data);
  }
}
