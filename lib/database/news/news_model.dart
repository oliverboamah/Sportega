import 'package:sportega/database/news/news_entity.dart';
import 'package:sportega/database/sportega_db.dart';
import 'package:sportega/ui/holders/news.dart';

class NewsModel {
  static SportegaDB _database;
  static NewsModel _newsModel;

  NewsModel._();

  static Future<NewsModel> getInstance() async {
    _database =
        await $FloorSportegaDB.databaseBuilder('sportega_db.db').build();

    if (_newsModel == null) {
      _newsModel = NewsModel._();
    }

    return _newsModel;
  }

  Future<void> insertNews(News news) async {
    NewsEntity newsEntity = NewsEntity(null, news.image, news.title,
        news.content, news.category, news.datetime, news.url);

    await _database.newsDao.insertNews(newsEntity);
  }

  Future<List<News>> getAllNews() async {
    List<NewsEntity> newsEntityList = await _database.newsDao.getAllNews();

    List<News> newsList = newsEntityList.map<News>((newsEntity) {
      return News(
          title: newsEntity.title,
          image: newsEntity.image,
          category: newsEntity.category,
          content: newsEntity.content,
          datetime: newsEntity.datetime,
          url: newsEntity.url);
    }).toList();

    return newsList;
  }
}
