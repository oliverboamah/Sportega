import 'dart:convert';
import 'package:http/http.dart';
import 'package:sportega/services/constants/constants.dart';
import 'package:sportega/ui/holders/photo.dart';

class PhotoRepo {
  Future<List<Photo>> getPhotos() async {
    final response = await get(Constants.SOCCER_PLAYERS_LIFESTYLE_VIDEOS_URL);
    var data = json.decode(response.body);

    return this._filterPhotos(data);
  }

  List<Photo> _filterPhotos(data) {
    List<Photo> filteredPhotos = [];

    data['items'].forEach((item) {
      filteredPhotos.add(Photo(
          image: item['snippet']['thumbnails']['high']['url'],
          title: item['snippet']['title']));
    });

    return filteredPhotos;
  }
}
