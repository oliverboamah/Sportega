import 'package:flutter/material.dart';
import 'package:sportega/ui/components/favorite/favorite_news_item.dart';

import 'package:sportega/ui/holders/news.dart';

class FavoriteNewsList extends StatefulWidget {
  final List<News> newsList;
  final Function onNewsItemClicked;

  FavoriteNewsList({
    @required this.newsList,
    this.onNewsItemClicked,
  });

  @override
  State<StatefulWidget> createState() => _FavoriteNewsListState();
}

class _FavoriteNewsListState extends State<FavoriteNewsList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int position) {
              return FavoriteNewsItem(
                position: position,
                news: this.widget.newsList[position],
                onFavoriteNewsItemClicked: (position) =>
                    this.widget.onNewsItemClicked(position),
              );
            },
            itemCount: this.widget.newsList.length));
  }
}
