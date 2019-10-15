import 'package:ux_navigation/resource/course/lesson/lesson_activity_additional_material.dart';
import 'package:ux_navigation/resource/course/lesson/lesson_activity_weblink.dart';
import 'package:ux_navigation/resource/course/lesson/test/test_comprehension.dart';

class LessonActivity {
  String id;
  int index;
  String title;
  String description;
  int number;
  int part;
  String youtube;
  String image;
  String duration;
  int likeUp;
  int likeDown;
  List<TestComprehension> listTestComprehension;
  List<LessonActivityAdditionalMaterial> listLessonActivityAdditionalMaterial;
  List<LessonActivityWeblink> listLessonActivityWeblink;

  LessonActivity(Map<String, dynamic> data) {
    this._config(data);
  }

  void _config(Map<String, dynamic> data) {
    List<TestComprehension> listTestComprehensionData = [];
    //Verifica se recebeu lista de teste de compreensão para a atividade
    if (data['test_comprehension'] != null) {
      int lenComprehensionTest = data['test_comprehension'].length;
      listTestComprehensionData = List.generate(lenComprehensionTest, (i) {
        return TestComprehension.generate(data['test_comprehension'][i]);
      });
    }

    List<LessonActivityAdditionalMaterial> listLessonActivityAdditionalMaterialData = [];
    //Verifica se recebeu lista de material adicional para a atividade
    if (data['additional_material'] != null) {
      int lenLessonActivityAdditionalMaterial = data['additional_material'].length;
      listLessonActivityAdditionalMaterialData = List.generate(lenLessonActivityAdditionalMaterial, (i) {
        return LessonActivityAdditionalMaterial.generate(data['additional_material'][i]);
      });
    }

    List<LessonActivityWeblink> listLessonActivityWeblinkData = [];
    //Verifica se recebeu lista de weblink para a atividade
    if (data['weblink'] != null) {
      int lenLessonActivityWeblink = data['weblink'].length;
      listLessonActivityWeblinkData = List.generate(lenLessonActivityWeblink, (i) {
        return LessonActivityWeblink.generate(data['weblink'][i]);
      });
    }

    this.id = data['id'];
    this.title = data['title'];
    this.description = data['description'];
    this.duration = data['duration'];
    this.listTestComprehension = listTestComprehensionData;
    this.listLessonActivityAdditionalMaterial = listLessonActivityAdditionalMaterialData;
    this.listLessonActivityWeblink = listLessonActivityWeblinkData;
  }

  factory LessonActivity.generate(Map<String, dynamic> data) {
    return LessonActivity(data);
  }
}
