import 'package:ux_navigation/resource/course/lesson/test/test_alternative.dart';

class TestFinal {
  String id;
  String title;
  String correct;
  int score;
  List<TestAlternative> listAlternatives;

  TestFinal(Map<String, dynamic> data) {
    this._config(data);
  }

  void _config(Map<String, dynamic> data) {
    int lenAlternatives = data['alternatives'].length;

    final List<TestAlternative> listAlternativesData = List.generate(lenAlternatives, (i) {
      return TestAlternative.generate(data['alternatives'][i]);
    });

    this.id = data['id'];
    this.title = data['title'];
    this.correct = data['correct'];
    this.score = data['score'] as int;
    this.listAlternatives = listAlternativesData;
  }

  factory TestFinal.generate(Map<String, dynamic> data) {
    return TestFinal(data);
  }
}
