import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ux_navigation/page/page_login.dart';
import 'package:ux_navigation/page/page_main.dart';

///
class PageSplashScreen extends StatefulWidget {
  @override
  _PageSplashScreenState createState() => _PageSplashScreenState();
}

class _PageSplashScreenState extends State<PageSplashScreen> {
  final bool isLogged = false;

  @override
  void initState() {
    super.initState();

    /// Limpa as configurações de UI Overlay
    SystemChrome.setEnabledSystemUIOverlays([]);

    /// Método de delay e navegação criado fora do initState
    loadData();

    /// Outro método de delay e navegação
    /*
    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => isLogged ? PageMain() : PageLogin()));
    });
     */
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Center(
          child: Container(
            width: 150,
            height: 150,
            child: Image.asset("assets/images/miranha.png"),
          ),
        )
    );
  }

  /// Método que fará um delay, posteriormente chamando outro método
  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  /// Método que será chamado após o delay
  /// Verifica o status de login e decide para qual página irá navegar
  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => isLogged ? PageMain() : PageLogin()));
  }
}
