import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportega/database/news/news_model.dart';
import 'package:sportega/services/api/news_repo.dart';
import 'package:sportega/ui/components/my_flush_bar.dart';
import 'package:sportega/ui/components/news/news_headline_list.dart';
import 'package:sportega/ui/components/news/news_list.dart';
import 'package:sportega/ui/components/news/trending_header.dart';
import 'package:sportega/ui/components/offline.dart';
import 'package:sportega/ui/components/progress.dart';
import 'package:sportega/ui/components/server_error.dart';
import 'package:sportega/ui/components/text_header.dart';
import 'package:sportega/ui/constants/load_data_status.dart';
import 'package:sportega/ui/holders/news.dart';
import 'package:sportega/ui/routes/routes.dart';
import 'package:sportega/util/sharing.dart';

class NewsTab extends StatefulWidget {
  final Function onGoToFavoriteButtonClicked;

  NewsTab({@required Key key, this.onGoToFavoriteButtonClicked})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  // load data status
  LoadDataStatus _loadDataStatus;

  // news data
  List<News> newsList = [];

  // news db model
  NewsModel newsModel;

  @override
  void initState() {
    super.initState();
    this._initializeModel();
    this._loadData();
  }

  // initialize news model
  void _initializeModel() async {
    this.newsModel = await NewsModel.getInstance();
  }

  void _loadData() {
    // returns true if tab state data is present and was loaded successfully
    if (this._initializeTabStateData()) {
      return;
    }

    // show progress indicator
    this.setState(() => this._loadDataStatus = LoadDataStatus.loading);

    NewsRepo().getNews().then((news) {
      this.setState(() {
        this.newsList = news;

        // save tab state data
        this._saveTabStateData(LoadDataStatus.success, news);
      });
    }).catchError((error) {
      this.setState(() {
        this._loadDataStatus = error is SocketException
            ? LoadDataStatus.offline
            : LoadDataStatus.serverError;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return this._content(context);
  }

  Widget _content(BuildContext context) {
    switch (this._loadDataStatus) {
      case LoadDataStatus.success:
        return this._getNewsWidget(context);
      case LoadDataStatus.offline:
        return this._getOfflineWidget();
      case LoadDataStatus.serverError:
        return this._getServerErrorWidget();
      default:
        return Progress();
    }
  }

  // widget containing all the news views
  Widget _getNewsWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        TextHeader(
          title: 'Top Stories',
          subTitle: 'Today, Sep 3rd, Tuesday',
        ),
        NewsHeadlineList(
          key: PageStorageKey('NewsHeadlineList'),
          newsList: this.newsList.sublist(0, 4),
          onItemSelected: (position) =>
              Routes().navigateToNewsPage(context, this.newsList[position]),
        ),
        TrendingHeader(
          title: 'Trending',
        ),
        NewsList(
          newsList: this.newsList.sublist(4),
          onNewsItemClicked: (position) =>
              Routes().navigateToNewsPage(context, this.newsList[position + 4]),
          onNewsItemFavoriteIconSelected: (position) =>
              this.saveNews(this.newsList[position + 4]),
          onNewsItemShareIconClicked: (position) =>
              Sharing.shareNews(this.newsList[position + 4]),
        )
      ],
    );
  }

  // offline widget
  Widget _getOfflineWidget() {
    return Offline(
      image: 'assets/images/offline.png',
      title: 'You are Offline',
      subTitle: 'Read news items you saved in your favorites folder',
      buttonTitle: 'Go to Favorites',
      onButtonClicked: () => this.widget.onGoToFavoriteButtonClicked(),
      onRetryClicked: () => this._loadData(),
    );
  }

  // offline widget
  Widget _getServerErrorWidget() {
    return ServerError(
      image: 'assets/images/server_error.png',
      title: 'Oops! It\'s not you, it\'s us',
      subTitle: 'A server error was encountered when loading the data',
      onRetryClicked: () => this._loadData(),
    );
  }

  // save news to database
  void saveNews(News news) async {
    this.newsModel.insertNews(news).then((value) {
      MyFlushbar().show(
          context: this.context,
          title: 'Success',
          message: 'News saved succesfully!',
          success: true);
    }).catchError((onError) {
      MyFlushbar().show(
          context: this.context, title: 'Oops', message: 'Error saving news!');
    });
  }

  void _saveTabStateData(LoadDataStatus success, List<News> news) {
    this._loadDataStatus = LoadDataStatus.success;
    PageStorage.of(this.context).writeState(context, LoadDataStatus.success,
        identifier: ValueKey('NewsTabLoadDataStatusState'));
    PageStorage.of(this.context).writeState(context, news,
        identifier: ValueKey('NewsTabNewsListState'));
  }

  // returns true if tab state data is present and was loaded successfully
  bool _initializeTabStateData() {
    // load tab state data if present
    var loadDataStatusState = PageStorage.of(this.context)?.readState(
        this.context,
        identifier: ValueKey('NewsTabLoadDataStatusState'));
    if (loadDataStatusState != null &&
        loadDataStatusState == LoadDataStatus.success) {
      this.setState(() {
        this._loadDataStatus = LoadDataStatus.success;
        this.newsList = PageStorage.of(this.context)?.readState(this.context,
            identifier: ValueKey('NewsTabNewsListState'));
      });
      return true;
    }

    return false;
  }
}
