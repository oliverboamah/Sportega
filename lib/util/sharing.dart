import 'package:share/share.dart';
import 'package:sportega/ui/holders/news.dart';

// class for sharing content to other apps
class Sharing {
  static void shareNews(News news) {
    Share.share('${news.title} ${news.url}');
  }
}
