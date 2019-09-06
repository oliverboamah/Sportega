import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportega/ui/components/news/news_heading.dart';
import 'package:sportega/ui/holders/news.dart';
import 'package:sportega/ui/layouts/news_app_bar.dart';

class NewsPage extends StatefulWidget {
  final News news;

  NewsPage({@required this.news});

  @override
  State<StatefulWidget> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            NewsAppBar(onSendIconClicked: () => print('send icon clicked'))
                .getNewsAppBar(context),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 16),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  NewsHeading(
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
