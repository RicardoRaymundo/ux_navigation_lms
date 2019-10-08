import 'package:flutter/cupertino.dart';
import 'package:ux_navigation/app/app_manager.dart';
import 'package:ux_navigation/theme/theme_select.dart';

class UiImage {
  static const String BACKGROUND = 'assets/tower.png';
  static const String APP_LOGO = 'assets/images/miranha.png';
  static const String PATH = 'assets/images';

  /// Prepara imagem para o background do container da informação dos cursos
  static AssetImage backgroundCourseContent() {
    switch (AppManager.theme) {
      case ThemeAspect.LIGHT:
        return AssetImage('assets/images/miranha.png');
      case ThemeAspect.DARK:
        return AssetImage('assets/images/bg_course_content_info.png');
    }
  }
}
