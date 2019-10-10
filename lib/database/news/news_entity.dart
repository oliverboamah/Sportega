import 'package:floor/floor.dart';

@entity
class NewsEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String image;
  final String title;
  final String content;
  final String category;
  final String datetime;
  final String url;

  NewsEntity(this.id, this.image, this.title, this.content, this.category,
      this.datetime, this.url);
}
