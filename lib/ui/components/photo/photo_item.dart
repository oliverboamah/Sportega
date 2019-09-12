import 'package:flutter/material.dart';
import 'package:sportega/ui/holders/photo.dart';
import 'package:sportega/values/colors/colors.dart';

class PhotoItem extends StatelessWidget {
  final int position;
  final Photo photo;
  final Function onClicked;

  PhotoItem({@required this.position, @required this.photo, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.onClicked(this.position),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  this.photo.image,
                  width: 160,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 150,
                height: 170,
                padding: EdgeInsets.only(top: 8, left: 8),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white.withOpacity(0.1)),
                child: Container(
                  child: Icon(Icons.photo, color: Colors.white),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 150,
            padding: EdgeInsets.only(top: 5),
            child: Text(
                this.photo.title.length <= 55
                  ? this.photo.title
                  : this.photo.title.substring(0, 55) + "...",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(PRIMARY_TEXT_COLOR)),
            ),
          ),
        ],
      ),
    );
  }
}
