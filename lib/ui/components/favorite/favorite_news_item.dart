import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sportega/ui/holders/news.dart';
import 'package:sportega/values/colors/colors.dart';

class FavoriteNewsItem extends StatefulWidget {
  final int position;
  final News news;
  final Function onFavoriteNewsItemClicked;

  FavoriteNewsItem({
    @required this.position,
    @required this.news,
    this.onFavoriteNewsItemClicked,
  });

  @override
  State<StatefulWidget> createState() => _FavoriteNewsItemState();
}

class _FavoriteNewsItemState extends State<FavoriteNewsItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.widget.onFavoriteNewsItemClicked(this.widget.position),
      child: Container(
        margin: EdgeInsets.only(top: 15, left: 16, right: 16),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: this.widget.news.image,
                width: 70,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                    width: 258,
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      this.widget.news.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Container(
                  width: 258,
                  padding: EdgeInsets.only(top: 10, left: 16),
                  child: Text(
                    this.widget.news.category,
                    style: TextStyle(color: Color(PRIMARY_COLOR)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
