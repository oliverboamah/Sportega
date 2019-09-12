import 'dart:convert';
import 'package:http/http.dart';
import 'package:sportega/services/constants/constants.dart';
import 'package:sportega/ui/holders/video.dart';

class VideoRepo {
  Future<List<Video>> getVideos() async {
    final response = await get(Constants.EPL_VIDEOS_URL);
    var rawVideos = json.decode(response.body);

    return this._filterVideos(rawVideos);
  }

  List<Video> _filterVideos(rawNews) {
    List<Video> filteredVideos = [];

    rawNews['items'].forEach((item) {
      if (item['id']['videoId'] != null) {
        filteredVideos.add(Video(
            videoId: item['id']['videoId'],
            image: item['snippet']['thumbnails']['high']['url'],
            title: item['snippet']['title'],
            description: item['snippet']['description'],
            time: item['snippet']['publishedAt']));
      }
    });

    return filteredVideos;
  }
}
