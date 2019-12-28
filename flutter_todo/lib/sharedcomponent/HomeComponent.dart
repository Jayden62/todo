import 'package:flutter/material.dart';
import 'package:flutter_todo/model/Note.dart';
import 'package:flutter_todo/style/BaseStyle.dart';

class HomeComponent extends StatefulWidget {
  /// Note contains info to display
  final Note item;

  /// Callback when tapping checkbox.
  final Function(Note item, bool value) callback;

  HomeComponent(this.item, {this.callback});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomeComponent> {
  @override
  Widget build(BuildContext context) {
    /// Create item if true, set item background is gray color else is white color
    return Container(
      color: widget.item.isChecked ? Colors.grey[200] : whiteColor,
      child: Row(children: <Widget>[info, checkBox]),
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

        /// True value will be displayed check
        value: widget.item.isChecked ? true : false,
      ));

  /// Info contain title, content.
  Widget get info => Expanded(
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
