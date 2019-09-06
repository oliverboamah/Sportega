import 'package:flutter/widgets.dart';
import 'package:sportega/ui/components/favorite/favorite_news_list.dart';
import 'package:sportega/ui/components/text_header.dart';
import 'package:sportega/ui/holders/news.dart';

class FavouriteTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
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
          title: 'Favourites',
          subTitle: '${this.newsList.length} articles',
        ),
        FavoriteNewsList(
          newsList: this.newsList,
          onNewsItemClicked: (position) => print(position),
        )
      ],
    );
  }
}
