import 'package:flutter/cupertino.dart';
import 'package:ux_navigation/page/page_login.dart';
import 'package:ux_navigation/page/page_main.dart';

class PageSplashScreen extends StatelessWidget {
  final bool isLogged = false;

  @override
  Widget build(BuildContext context) {
    /// Se estiver logado, carrega a MainPage
    /// Se nao estiver logado, carrega a LoginPage
    return isLogged ? PageMain() : PageLogin();
  }
}
