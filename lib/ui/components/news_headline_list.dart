import 'package:flutter/cupertino.dart';
import 'package:sportega/ui/components/news_headline_item.dart';
import 'package:sportega/ui/holders/news.dart';

class NewsHeadlineList extends StatefulWidget {
  final List<News> newsList;
  final Function onItemSelected;

  NewsHeadlineList({@required this.newsList, this.onItemSelected});

  @override
  State<StatefulWidget> createState() => _NewsHeadlineListState();
}

class _NewsHeadlineListState extends State<NewsHeadlineList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int position) {
            return NewsHeadlineItem(
              position: position,
              onClicked: (position) => this.widget.onItemSelected(position),
              news: this.widget.newsList[position],
            );
          },
          itemCount: this.widget.newsList.length),
    );
  }
}
