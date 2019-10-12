import 'package:floor/floor.dart';
import 'package:sportega/database/news/news_entity.dart';

@dao
abstract class NewsDao {

  @insert
  Future<void> insertNews(NewsEntity newsEntity);

  @Query('SELECT * FROM NewsEntity ORDER BY id DESC')
  Future<List<NewsEntity>> getAllNews();

  @Query('DELETE FROM NewsEntity')
  Future<void> deleteAllNews();
}
