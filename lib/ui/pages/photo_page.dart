import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sportega/ui/holders/photo.dart';

class PhotoPage extends StatelessWidget {
  final Photo photo;

  PhotoPage({this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
          padding: EdgeInsets.only(top: 24),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Text(
                          'Back',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 50),
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: PhotoView(
                  imageProvider: NetworkImage(this.photo.image),
                ),
              )
            ],
          )),
    );
  }
}
