import 'package:flutter/widgets.dart';
import 'package:sportega/database/news/news_model.dart';
import 'package:sportega/ui/components/favorite/favorite_news_list.dart';
import 'package:sportega/ui/components/progress.dart';
import 'package:sportega/ui/components/text_header.dart';
import 'package:sportega/ui/constants/load_data_status.dart';
import 'package:sportega/ui/holders/news.dart';
import 'package:sportega/ui/routes/routes.dart';

class FavouriteTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  // news data list
  List<News> newsList = [];

  // load data status
  LoadDataStatus _loadDataStatus;

  // news db model
  NewsModel newsModel;

  @override
  void initState() {
    super.initState();
    this._loadData();
  }

  void _loadData() async {
    // show progress indicator
    this.setState(() => this._loadDataStatus = LoadDataStatus.loading);

    try {
      this.newsModel = await NewsModel.getInstance();
      newsList = await this.newsModel.getAllNews();
      this.setState(() => this._loadDataStatus =
          newsList.length > 0 ? LoadDataStatus.success : LoadDataStatus.nodata);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return this.content(context);
  }

  Widget content(BuildContext context) {
    switch (this._loadDataStatus) {
      case LoadDataStatus.success:
        return getFavoritesWidget();
      case LoadDataStatus.nodata:
        return Center(child: Text('No Favorite news available'));
      default:
        return Progress();
    }
  }

  // widget contains all favorite news
  Widget getFavoritesWidget() {
    return Column(
      children: <Widget>[
        TextHeader(
          title: 'Favourites',
          subTitle: '${this.newsList.length} articles',
        ),
        FavoriteNewsList(
          newsList: this.newsList,
          onNewsItemClicked: (position) =>
              Routes().navigateToNewsPage(context, this.newsList[position]),
        )
      ],
    );
  }
}
