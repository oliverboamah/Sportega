import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportega/ui/holders/news.dart';
import 'package:sportega/values/colors/colors.dart';
import 'package:sportega/values/dimen/dimen.dart';

class NewsItem extends StatefulWidget {
  final int position;
  final News news;
  final Function onNewsItemClicked;
  final Function onShareIconClicked;
  final Function onFavoriteIconSelected;

  NewsItem(
      {@required this.position,
      @required this.news,
      this.onNewsItemClicked,
      this.onShareIconClicked,
      this.onFavoriteIconSelected}); 

  @override
  State<StatefulWidget> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  // state
  bool isFavoriteIconSeleted = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.widget.onNewsItemClicked(this.widget.position),
      child: Container(
        margin: EdgeInsets.only(top: 15, left: 16, right: 16),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                this.widget.news.image,
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
                  padding: EdgeInsets.only(top: 10, left: 15),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          this.setState(() => this.isFavoriteIconSeleted =
                              !this.isFavoriteIconSeleted);

                          if (isFavoriteIconSeleted) {
                            this
                                .widget
                                .onFavoriteIconSelected(this.widget.position);
                          }
                        },
                        child: Icon(
                          CupertinoIcons.heart_solid,
                          size: SMALL_ICON_SIZE,
                          color: this.isFavoriteIconSeleted
                              ? Color(PRIMARY_TEXT_COLOR)
                              : Color(SECONDARY_TEXT_COLOR),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: InkWell(
                            onTap: () => this
                                .widget
                                .onShareIconClicked(this.widget.position),
                            child: Icon(
                              CupertinoIcons.share_up,
                              color: Color(SECONDARY_TEXT_COLOR),
                            ),
                          )),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            this.widget.news.category,
                            style: TextStyle(color: Color(PRIMARY_COLOR)),
                          ),
                        ),
                      )
                    ],
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
