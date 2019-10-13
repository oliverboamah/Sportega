import 'package:sportega/env.dart';

class Constants {
  static const String SPORT_NEWS_URL =
      'http://newsapi.org/v2/top-headlines?sources=bbc-sport&apiKey=$NEWS_API_KEY';
  static const String EPL_VIDEOS_URL =
      'https://www.googleapis.com/youtube/v3/search?q=Premier%20League&key=$GOOGLE_API_KEY&part=snippet&maxResults=21';

  static const String SOCCER_PLAYERS_LIFESTYLE_VIDEOS_URL =
      'https://www.googleapis.com/youtube/v3/search?q=soccer%player%lifestyle&key=$GOOGLE_API_KEY&part=snippet&maxResults=50';
}
