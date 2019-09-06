import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportega/ui/components/article/article_heading.dart';
import 'package:sportega/ui/holders/news.dart';
import 'package:sportega/ui/layouts/article_app_bar.dart';

class ArticlePage extends StatefulWidget {
  final News news;

  ArticlePage({this.news});

  @override
  State<StatefulWidget> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            ArticleAppBar(onSendIconClicked: () => print('send icon clicked'))
                .getArticleAppBar(context),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 16),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  ArticleHeading(
                    title: this.widget.news.title,
                    datetime: this.widget.news.datetime,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Image.asset(
                      this.widget.news.image,
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 12, left: 16, right: 16, bottom: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Text(this.widget.news.content),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
