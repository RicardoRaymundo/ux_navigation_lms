import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/app/app_routing.dart';
import 'package:ux_navigation/ui/ui_image.dart';

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {



  /// Reconfigura as configurações de UI Overlay
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[loginHeader(), loginFields(context)],
          ),
        ),
      ),
    );
  }

  Widget loginHeader() => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[

      // TODO:: Trocar esse widget pelo logo do app da tela de login
      SvgPicture.asset(UiImage.APP_LOGO_SVG, semanticsLabel: 'Acme Logo'),
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

  Widget loginFields(BuildContext context) => Container(
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
              Navigator.popAndPushNamed(context, AppRouting.PAGE_MAIN);
            },
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "CRIAR UMA CONTA",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );
}