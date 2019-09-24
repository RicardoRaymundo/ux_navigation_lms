import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ux_navigation/app/app_routes.dart';
import 'package:ux_navigation/theme/theme_config.dart';
import 'package:ux_navigation/theme/theme_select.dart';

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {

  final String assetName = 'assets/svg/logo-new-school.svg';

  /// Lista de themes que poderão ser escolhidos pelo seletor de themes
  final List<ThemeAspect> listThemeAspect = [
    ThemeAspect.LIGHT,
    ThemeAspect.DARK,
    ThemeAspect.DARKER,
    ThemeAspect.COLORS,
  ];


  /// Reconfigura as configurações de UI Overlays
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  /// Método que alterna entre os temas, de acordo com o key que é passada
  void _changeTheme(BuildContext context, ThemeAspect aspect) {
    /// Usando o método static do InheritedWidget pai para alterar o tema,
    /// atravéz da key recebida
    ThemeConfig.instanceOf(context).changeTheme(aspect);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: loginBody(context),
      ),
    );
  }

  loginBody(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[loginHeader(), loginFields(context)],
    ),
  );

  loginHeader() => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Placeholder(
        fallbackHeight: 50,
        fallbackWidth: 50,
      ),
      SizedBox(height: 20.0),
      Text(
        "Seja bem-vindo.",
        style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xffb2228c)),
      ),
      SizedBox(height: 5.0),
      Text(
        "Faça login para continuar",
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );

  loginFields(BuildContext context) => Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
          child: TextField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "Digite seu nome de usuário",
              labelText: "Nome de usuário",
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: TextField(
            maxLines: 1,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Digite sua senha",
              labelText: "Senha",
            ),
          ),
        ),
        SizedBox(height: 30.0),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          width: double.infinity,
          child: RaisedButton(
            padding: EdgeInsets.all(12.0),
            shape: StadiumBorder(),
            child: Text(
              "ENTRAR",
              style: TextStyle(color: Colors.white),
            ),
            color: Color(0xffb2228c),
            onPressed: () {
              //TODO:: SHOWPLAYER ????
              //CustomNavigator.showPlayer(context, MainPage(currentTabIndex, selectedTab));
              Navigator.popAndPushNamed(context, AppRoutes.pagesMain);
            },
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "CRIAR UMA CONTA",
          style: TextStyle(color: Colors.grey),
        ),
        _selectPopup(context)
      ],
    ),
  );
  Widget _simplePopup() => PopupMenuButton<int>(
    icon: Icon(Icons.palette),
    itemBuilder: (context) => [
      PopupMenuItem(
        value: 1,
        child: Text("First"),
      ),
      PopupMenuItem(
        value: 2,
        child: Text("Second"),
      ),
    ],
  );
  Widget _threeItemPopup() => PopupMenuButton(
    itemBuilder: (context) {
      var list = List<PopupMenuEntry<Object>>();
      list.add(
        PopupMenuItem(
          child: Text("Setting Language"),
          value: 1,
        ),
      );
      list.add(
        PopupMenuDivider(
          height: 10,
        ),
      );
      list.add(
        CheckedPopupMenuItem(
          child: Text(
            "English",
            style: TextStyle(color: Colors.blue),
          ),
          value: 2,
          checked: true,
        ),
      );
      return list;
    },
    icon: Icon(
      Icons.settings,
      size: 50,
      color: Colors.white,
    ),
  );
  Widget _selectPopup(BuildContext context) => PopupMenuButton<int>(
    itemBuilder: (context) => [
      PopupMenuItem(
        value: 0,
        child: Text("Light"),
      ),
      PopupMenuItem(
        value: 1,
        child: Text("Dark"),
      ),
      PopupMenuItem(
        value: 3,
        child: Text("Darker"),
      ),
      PopupMenuItem(
        value: 3,
        child: Text("Colors"),
      ),
    ],
    initialValue: 2,
    onCanceled: () {
      print("You have canceled the menu.");
    },
    onSelected: (value) {
      _changeTheme(context, listThemeAspect[value]);
    },
    icon: Icon(Icons.palette),
  );
}