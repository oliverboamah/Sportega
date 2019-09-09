import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServerError extends StatelessWidget {
  // props
  final String image;
  final String title;
  final String subTitle;
  final String retryText;
  final Function onRetryClicked;

  ServerError(
      {@required this.image,
      @required this.title,
      @required this.subTitle,
      @required this.onRetryClicked,
      this.retryText = 'RETRY'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              this.image,
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            this.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(
            width: 210,
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              this.subTitle,
              textAlign: TextAlign.center,
            ),
          ),
          FlatButton(
            child: Text(
              this.retryText,
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () => this.onRetryClicked(),
          )
        ],
      ),
    );
  }
}
