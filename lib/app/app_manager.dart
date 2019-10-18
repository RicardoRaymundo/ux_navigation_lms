import 'package:ux_navigation/custom/theme/theme_select.dart';

class AppManager {
  AppManager._(); // this basically makes it so you can instantiate this class

  static ThemeAspect theme = ThemeAspect.DARK;

  static setDefaultTheme(ThemeAspect theme) {
    AppManager.theme = theme;
  }
}
