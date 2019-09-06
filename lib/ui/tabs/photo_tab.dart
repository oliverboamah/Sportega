import 'package:flutter/widgets.dart';
import 'package:sportega/ui/components/photo/photo_list.dart';
import 'package:sportega/ui/holders/photo.dart';
import 'package:sportega/ui/routes/routes.dart';

class PhotoTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PhotoTabState();
}

class _PhotoTabState extends State<PhotoTab> {
  // state
  List<Photo> photoList = [];

  @override
  void initState() {
    super.initState();
    this._retrievePhotoList();
  }

  @override
  Widget build(BuildContext context) {
    return PhotoList(
      photoList: this.photoList,
      onItemSelected: (position) =>
          Routes().navigateToPhotoPage(context, this.photoList[position]),
    );
  }

  void _retrievePhotoList() {
    for (int i = 0; i < 10; i++) {
      photoList.add(Photo(
        image: 'assets/images/drogba.jpg',
        title: 'Rooney is the fucking best player in the world',
      ));
    }
  }
}
