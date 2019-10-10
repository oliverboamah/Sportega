import 'package:floor/floor.dart';

@entity
class NewsEntity {

  @PrimaryKey(autoGenerate: true)
  int id;

  String image;
  String title;
  String content;
  String category;
  String datetime;
  String url;

  NewsEntity(
      {this.title,
      this.image,
      this.content,
      this.category,
      this.datetime,
      this.url});
}
