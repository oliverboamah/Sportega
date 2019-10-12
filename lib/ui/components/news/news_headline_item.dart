import 'package:flutter/material.dart';
import 'package:sportega/ui/holders/news.dart';

class NewsHeadlineItem extends StatelessWidget {
  final int position;
  final News news;
  final Function onClicked;

  NewsHeadlineItem(
      {@required this.position, @required this.news, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.onClicked(this.position),
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              spreadRadius: -2,
              offset: Offset(-5, -3))
        ],
        borderRadius: BorderRadius.circular(10)
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                this.news.image,
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                width: 300,
                height: 200,
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  this.news.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
