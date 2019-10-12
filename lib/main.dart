import 'package:flutter/material.dart';
import 'package:sportega/env.dart';
import 'package:sportega/ui/pages/splash_page.dart';
import 'package:sportega/values/colors/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: APP_NAME,
        theme: ThemeData(
          primaryColor: Color(PRIMARY_COLOR),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashPage());
  }
}
