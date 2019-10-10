class News {
  String image;
  String title;
  String content;
  String category;
  String datetime;
  String url;

  News(
      {this.title,
      this.image,
      this.content = '',
      this.category = '',
      this.datetime = '',
      this.url = ''});

  @override
  String toString() {
    return 'image: $image, title: $title, content: $content, category: $category, datetime: $datetime, url: $url';
  }
}
