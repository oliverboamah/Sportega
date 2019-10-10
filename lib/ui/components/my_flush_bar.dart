import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class MyFlushbar {
  void show(
      {BuildContext context, String title, String message, bool success}) {
    Flushbar(
      padding: EdgeInsets.all(10),
      borderRadius: 5,
      backgroundGradient: LinearGradient(
        colors: success == true
            ? [Colors.green.shade800, Colors.greenAccent.shade700]
            : [Colors.red.shade800, Colors.red.shade700],
        stops: [0.6, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      // All of the previous Flushbars could be dismissed by swiping down
      // now we want to swipe to the sides
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      // The default curve is Curves.easeOut
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: title,
      message: message,
      duration: Duration(seconds: 1),
    )..show(context);
  }
}
