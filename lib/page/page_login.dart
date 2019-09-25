import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/app/app_routing.dart';
import 'package:ux_navigation/ui/ui_image.dart';
import 'package:ux_navigation/ui/ui_label.dart';

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
            children: <Widget>[this.header(), this.form(context)],
          ),
        ),
      ),
    );
  }

  Widget header() =>
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SvgPicture.asset(UiImage.APP_LOGO_SVG, height: 100, width: 100,),
          SizedBox(height: 20.0),
          Text(
            UILabel.WELCOME,
            style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xffb2228c)),
          ),
          SizedBox(height: 5.0),
          Text(
            UILabel.LOGIN_TO_CONTINUE,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  Widget form(BuildContext context) =>
      Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
          child: TextField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: UILabel.TYPE_USER_NAME,
              labelText: UILabel.USER_NAME,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: TextField(
            maxLines: 1,
            obscureText: true,
            decoration: InputDecoration(
              hintText: UILabel.TYPE_PASSWORD,
              labelText: UILabel.PASSWORD,
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
            child: Text(UILabel.ENTER),
            onPressed: () {
              Navigator.popAndPushNamed(context, AppRouting.PAGE_MAIN);
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          width: double.infinity,
          child: RaisedButton(
            elevation: 0,
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.all(12.0),
            shape: StadiumBorder(),
            child: Text(UILabel.CREATE_ACCOUNT, style: Theme.of(context).textTheme.button,),
            onPressed: () {
              Navigator.popAndPushNamed(context, AppRouting.PAGE_CREATE_ACCOUNT);
            },
          ),
        ),
      ],
    ),
  );
}