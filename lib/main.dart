import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ux_navigation/app/app_behavior.dart';
import 'package:ux_navigation/page/page_splashscreen.dart';
import 'package:ux_navigation/theme/theme_config.dart';
import 'package:ux_navigation/theme/theme_select.dart';
import 'package:ux_navigation/app/app_routing.dart';
import 'package:ux_navigation/ui/ui_label.dart';

void main() {
  //Orientação do app
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(

    /// Envolvendo o Main em um StatefulWidget, que é filho de um InheritedWidget
    ThemeConfig(

      /// Tema inicial
      initialTheme: ThemeAspect.DARK,
      child: Main(),
    ),
  );
}

///
class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

///
class _MainState extends State<Main> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UILabel.APP_TITLE,
      theme: ThemeConfig.of(context),
      debugShowCheckedModeBanner: false,

      builder: (context, child) {
        /// Retira effeito de 'barriga' no fim de scroll
        return ScrollConfiguration(
          behavior: AppBehavior(),
          child: child,
        );
      },

      home: Scaffold(
        body: PageSplashScreen(),
      ),
      routes: AppRouting.routes(),
    );
  }

}
