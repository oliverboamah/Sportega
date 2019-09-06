import 'package:flutter/widgets.dart';
import 'package:sportega/ui/components/article/news_headline_list.dart';
import 'package:sportega/ui/components/article/news_list.dart';
import 'package:sportega/ui/components/article/trending_header.dart';
import 'package:sportega/ui/components/text_header.dart';
import 'package:sportega/ui/holders/news.dart';

class ArticleTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ArticleTabState();
}

class _ArticleTabState extends State<ArticleTab> {
  List<News> newsList = [
    News(
        image: 'assets/images/rooney.png',
        title: 'Why Rooney is the best forward ever at Manchester United',
        category: 'bbc-sport'),
    News(
        image: 'assets/images/drogba.jpg',
        title:
            'Why Didier Drogba could be a better chelsea manager than Lampard',
        category: 'bbc-sport'),
      News(
        image: 'assets/images/rooney.png',
        title: 'Why Rooney is the best forward ever at Manchester United',
        category: 'bbc-sport'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextHeader(
          title: 'Top Stories',
          subTitle: 'Today, Sep 3rd, Tuesday',
        ),
        NewsHeadlineList(
          newsList: this.newsList,
          onItemSelected: (position) => print(position),
        ),
        TrendingHeader(
          title: 'Trending',
        ),
        NewsList(
          newsList: this.newsList,
          onNewsItemClicked: (position) => print(position),
          onNewsItemFavoriteIconClicked: (position) => print(position),
        )
      ],
    );
  }
}
