import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ux_navigation/app/app_behavior.dart';
import 'package:ux_navigation/app/app_routes.dart';
import 'package:ux_navigation/page/info/video/info_video_page.dart';
import 'package:ux_navigation/page/page_splashscreen.dart';
import 'package:ux_navigation/page/page_login.dart';
import 'package:ux_navigation/page/page_main.dart';
import 'package:ux_navigation/theme/theme_config.dart';
import 'package:ux_navigation/theme/theme_select.dart';

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
      title: 'Theme selector example',
      theme: ThemeConfig.of(context),
      debugShowCheckedModeBanner: false,

      /// Retira effeito de 'barriga' no fim de scroll
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: AppBehavior(),
          child: child,
        );
      },

      /// Recupera o tema default e configura o tema da aplicação
      home: Scaffold(
        appBar: AppBar(

          backgroundColor: Theme
              .of(context)
              .primaryColor,

          /// Recupera uma cor do tema da aplicação
          title: Text(
            'Main Page',

            /// Configurando o texto da app bar para o estilo padrão para titles,
            /// definido no ThemeData do Material App. Porém com o método 'copyWith',
            /// o tamanho da fonte é alterado para esse texto.
            style: Theme
                .of(context)
                .textTheme
                .title
                .copyWith(fontSize: 20),
          ),
        ),
        body: PageSplashScreen(),
      ),
      routes: <String, WidgetBuilder>{
        /// Rotas do app
        AppRoutes.pagesMain: (BuildContext context) => PageMain(),
        AppRoutes.pagesLogin: (BuildContext context) => PageLogin(),
        AppRoutes.infoVideoPage: (BuildContext context) => InfoVideoPage(),
      },
    );
  }

}
