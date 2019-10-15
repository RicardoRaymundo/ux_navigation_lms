import 'package:ux_navigation/resource/course/lesson/lesson_activity.dart';
import 'package:ux_navigation/resource/course/lesson/test/test_final.dart';
import 'package:ux_navigation/resource/course/lesson/test/test_placement.dart';

class Lesson {
  String id;
  String title;
  String description;
  List<LessonActivity> listLessonActivity;
  List<TestPlacement> listTestPlacement;
  List<TestFinal> listTestFinal;

  Lesson(Map<String, dynamic> data) {
    this._config(data);
  }

  void _config(Map<String, dynamic> data) {
    int lenActivities = data['activities'].length;
    int lenPlacementTest = data['test_placement'].length;
    int lenFinalTest = data['test_final'].length;

    final List<LessonActivity> listLessonActivityData = List.generate(lenActivities, (i) {
      return LessonActivity.generate(data['activities'][i]);
    });

    final List<TestPlacement> listTestPlacementData = List.generate(lenPlacementTest, (i) {
      return TestPlacement.generate(data['test_placement'][i]);
    });

    final List<TestFinal> listTestFinalData = List.generate(lenFinalTest, (i) {
      return TestFinal.generate(data['test_final'][i]);
    });

    this.id = data['id'] as String;
    this.title = data['title'] as String;
    this.description = data['description'] as String;
    this.listLessonActivity = listLessonActivityData;
    this.listTestPlacement = listTestPlacementData;
    this.listTestFinal = listTestFinalData;
  }

  factory Lesson.generate(Map<String, dynamic> data) {
    return Lesson(data);
  }
}
