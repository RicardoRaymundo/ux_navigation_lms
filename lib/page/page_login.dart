import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux_navigation/app/app_routing.dart';
import 'package:ux_navigation/ui/ui_label.dart';
import 'package:ux_navigation/ui/ui_svg.dart';

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
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
          SizedBox(height: 30.0),
          SvgPicture.asset(
            UiSVG.APP_LOGO,
            height: 150,
            width: 150,
          ),
          SizedBox(height: 20.0),
          Text(
            UILabel.WELCOME,
            style: Theme
                .of(context)
                .primaryTextTheme
                .display1,
          ),
          SizedBox(height: 5.0),
          Text(
            UILabel.LOGIN_TO_CONTINUE,
            style: Theme
                .of(context)
                .accentTextTheme
                .display2,
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
            SizedBox(height: 40.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  UILabel.ENTER,
                  style: Theme
                      .of(context)
                      .textTheme
                      .button,
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, AppRouting.PAGE_MAIN);
                },
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  UILabel.WHAT_IS_NEW_SCHOOL,
                  style: Theme
                      .of(context)
                      .textTheme
                      .button,
                ),
                color: Colors.blue[800],
                onPressed: () {
                  Navigator.popAndPushNamed(context, AppRouting.PAGE_MAIN);
                },
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: RaisedButton(
                color: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
                elevation: 0,
                highlightElevation: 0,
                child: Text(
                  UILabel.CREATE_ACCOUNT,
                  style: Theme
                      .of(context)
                      .textTheme
                      .button,
                ),
                onPressed: () {
                  // Navigator.popAndPushNamed(context, AppRouting.PAGE_CREATE_ACCOUNT);
                },
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      );
}
