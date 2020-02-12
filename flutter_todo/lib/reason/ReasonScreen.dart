import 'package:flutter/material.dart';
import 'package:flutter_todo/help/HelpScreen.dart';

class ReasonScreen extends StatefulWidget {
  final Question item;

  ReasonScreen(this.item);

  @override
  State<StatefulWidget> createState() => ReasonState();
}

class ReasonState extends State<ReasonScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              child: TextField(
                  decoration: InputDecoration(
                      hintText: 'reason select ${widget.item.title}')),
              padding: EdgeInsets.all(20),
            ),
            RaisedButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      )),
    );
  }
}
