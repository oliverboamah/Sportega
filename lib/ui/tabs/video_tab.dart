import 'package:flutter/widgets.dart';
import 'package:sportega/ui/components/video/video_list.dart';
import 'package:sportega/ui/holders/video.dart';

class VideoTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VideoTabState();
}

class _VideoTabState extends State<VideoTab> {
  // state
  List<Video> videoList = [];

  @override
  void initState() {
    super.initState();
    this._retrieveVideoList();
  }

  @override
  Widget build(BuildContext context) {
    return VideoList(
      videoList: this.videoList,
      onItemSelected: () => {},
    );
  }

  void _retrieveVideoList() {
    for (int i = 0; i < 10; i++) {
      videoList.add(Video(
          image: 'assets/images/rooney.png',
          title: 'Rooney is the fucking best player in the world',
          time: '2 hours ago'));
    }
  }
}
