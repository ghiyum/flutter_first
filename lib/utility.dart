import 'package:flutter/material.dart';

class Utility {
 static ShowDialog(BuildContext context, String comment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          // title: new Text("Alert Dialog title"),
          content: new Text(comment),
          actions: <Widget>[
            new FlatButton(
              child: new Text("확인"),
              onPressed: () {
                Navigator.pushNamed(context, '/Home');
              },
            ),
          ],
        );
      },
    );
  }
}

