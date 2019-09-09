import 'dart:convert';

import 'package:http/http.dart';
import 'package:sportega/ui/holders/news.dart';

import '../constants/constants.dart';

class NewsRepo {
  Future<List<News>> getNews() async {
    final response = await get(Constants.SPORT_NEWS_URL);
    var rawNews = json.decode(response.body);

    return this._filterNews(rawNews);
  }

  List<News> _filterNews(rawNews) {
    List<News> filteredNews = [];

    rawNews['articles'].forEach((item) {
      filteredNews.add(News(
          category: item['source']['id'],
          title: item['title'],
          content: item['content'],
          image: item['urlToImage'],
          datetime: item['publishedAt'],
          url: item['url']));
    });

    return filteredNews;
  }
}
