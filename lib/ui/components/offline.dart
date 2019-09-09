import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Offline extends StatelessWidget {
  // props
  final String image;
  final String title;
  final String subTitle;
  final String buttonTitle;
  final String retryText;
  final Function onButtonClicked;
  final Function onRetryClicked;

  Offline(
      {@required this.image,
      @required this.title,
      @required this.subTitle,
      @required this.buttonTitle,
      @required this.onButtonClicked,
      @required this.onRetryClicked,
      this.retryText = 'RETRY'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            this.image,
            width: 100,
            height: 100,
            fit: BoxFit.fitHeight,
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
          Padding(
            padding: const EdgeInsets.only(
              top: 22.0,
            ),
            child: FlatButton(
              padding:
                  EdgeInsets.only(top: 12, bottom: 12, left: 32, right: 32),
              child: Text(
                this.buttonTitle,
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () => this.onButtonClicked(),
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
