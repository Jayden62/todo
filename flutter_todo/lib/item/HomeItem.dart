import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo/style/BaseStyle.dart';

class HomeItem extends StatefulWidget {
  final String id;
  final String title;
  final String content;
  final bool isChecked;

  const HomeItem(this.id, this.title, this.content, {this.isChecked});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomeItem> {
  final checkStream = StreamController<bool>.broadcast();
  bool check;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    checkStream.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: checkStream.stream,
      builder: (context, snapshot) {
        Color colorItem;

        if (snapshot.hasData) {
          check = snapshot.data;
          if (check) {
            colorItem = Colors.blue[100];
          } else {
            colorItem = whiteColor;
          }
        } else {
          colorItem = whiteColor;
        }

        return Container(
          color: colorItem,
          child: Row(children: <Widget>[base, checkBox]),
        );
      },
    );
  }

  /// Divider
  Widget get divider => Container(child: Divider(color: Colors.grey));

  /// Is Checked
  Widget get checkBox => Container(
      margin: EdgeInsets.only(right: margin10, top: margin10),
      child: StreamBuilder(
        stream: checkStream.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            check = snapshot.data;
          } else {
            check = false;
          }

          return Checkbox(
            onChanged: (bool value) {
              check = value;
              if (!check) {
                check = false;
                checkStream.sink.add(false);
              } else {
                check = true;
                checkStream.sink.add(true);
              }
              return check;
            },
            value: widget.isChecked,
          );
        },
      ));

  /// Base
  Widget get base => Expanded(
      child: Container(
          margin: EdgeInsets.only(left: margin10, top: margin10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// Title
              Container(
                padding: EdgeInsets.all(padding5),
                child: Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),

              /// Content
              Container(
                padding: EdgeInsets.all(padding5),
                child: Text(widget.content),
              ),
            ],
          )));
}
