import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportega/ui/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    this._navigateToHomePage();
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

  void _navigateToHomePage() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }
}
