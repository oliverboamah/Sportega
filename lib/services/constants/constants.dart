class Constants {

  static const _newsAPIKey = '534cbf3997b34808a8a69f1b6a0f81ad';
  static const _youtubeAPIKey = 'AIzaSyDm-Wj1xJhDbMfIfQwLiaDajvhAu50ETic';

  static const String SPORT_NEWS_URL =
      'http://newsapi.org/v2/top-headlines?sources=bbc-sport&apiKey=$_newsAPIKey';
  static const String EPL_VIDEOS_URL =
      'https://www.googleapis.com/youtube/v3/search?q=Premier%20League&key=$_youtubeAPIKey&part=snippet&maxResults=21';

  static const String SOCCER_PLAYERS_LIFESTYLE_VIDEOS_URL =
      'https://www.googleapis.com/youtube/v3/search?q=soccer%player%lifestyle&key=$_youtubeAPIKey&part=snippet&maxResults=50';
}
