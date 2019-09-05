import 'package:flutter/widgets.dart';
import 'package:sportega/ui/components/photo_item.dart';
import 'package:sportega/ui/holders/photo.dart';

class PhotoList extends StatefulWidget {
  final List<Photo> photoList;
  final Function onItemSelected;

  PhotoList({this.photoList, this.onItemSelected});

  @override
  State<StatefulWidget> createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        childAspectRatio: 0.77,
        children: List.generate(this.widget.photoList.length, (position) {
          return PhotoItem(
            position: position,
            photo: this.widget.photoList[position],
            onClicked: (position) => this.widget.onItemSelected(position),
          );
        }),
      ),
    );
  }
}
