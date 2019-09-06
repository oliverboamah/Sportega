import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportega/ui/holders/news.dart';
import 'package:sportega/ui/pages/home_page.dart';
import 'package:sportega/ui/pages/news_page.dart';

class Routes {
  void navigateToHomePage(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  void navigateToNewsPage(BuildContext context, News news) {
    Future(() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NewsPage(news: news)));
    });
  }
}
