import 'package:flutter/widgets.dart';
import 'package:sportega/ui/components/video_item.dart';
import 'package:sportega/ui/holders/video.dart';

class VideoList extends StatefulWidget {
  final List<Video> videoList;
  final Function onItemSelected;

  VideoList({this.videoList, this.onItemSelected});

  @override
  State<StatefulWidget> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        childAspectRatio: 0.7,
        children: List.generate(this.widget.videoList.length, (position) {
          return VideoItem(
            position: position,
            video: this.widget.videoList[position],
            onClicked: (position) => this.widget.onItemSelected(position),
          );
        }),
      ),
    );
  }
}
