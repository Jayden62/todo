import 'package:flutter/material.dart';
import 'package:flutter_todo/model/Note.dart';
import 'package:flutter_todo/style/BaseStyle.dart';

class HomeItem extends StatefulWidget {
  final Note item;
  final Function(Note item, bool value) callback;

  HomeItem(this.item, {this.callback});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.item.isChecked ? Colors.grey[200] : whiteColor,
      child: Row(children: <Widget>[base, checkBox]),
    );
  }

  /// Is checked
  Widget get checkBox => Container(
      margin: EdgeInsets.only(right: margin10, top: margin10),
      child: Checkbox(
        onChanged: (bool value) {
          /// Call back
          widget.callback(widget.item, value);
          return value;
        },
        value: widget.item.isChecked ? true : false,
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
                  widget.item.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),

              /// Content
              Container(
                padding: EdgeInsets.all(padding5),
                child: Text(widget.item.content),
              ),
            ],
          )));
}
