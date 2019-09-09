import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportega/services/api/news_repo.dart';
import 'package:sportega/ui/routes/routes.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Routes().navigateToHomePage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/logo.png')),
        ));
  }
}
