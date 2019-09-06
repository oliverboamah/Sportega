import 'package:flutter/material.dart';
import 'package:sportega/ui/components/news/news_item.dart';
import 'package:sportega/ui/holders/news.dart';

class NewsList extends StatefulWidget {
  final List<News> newsList;
  final Function onNewsItemClicked;
  final Function onNewsItemShareIconClicked;
  final Function onNewsItemFavoriteIconClicked;

  NewsList(
      {@required this.newsList,
      this.onNewsItemClicked,
      this.onNewsItemShareIconClicked,
      this.onNewsItemFavoriteIconClicked});

  @override
  State<StatefulWidget> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int position) {
              return NewsItem(
                position: position,
                news: this.widget.newsList[position],
                onNewsItemClicked: (position) =>
                    this.widget.onNewsItemClicked(position),
                onFavoriteIconClicked: (position) =>
                    this.widget.onNewsItemFavoriteIconClicked(position),
                onShareIconClicked: (position) =>
                    this.widget.onNewsItemShareIconClicked(position),
              );
            },
            itemCount: this.widget.newsList.length));
  }
}
