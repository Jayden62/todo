import 'package:flutter/material.dart';
import 'package:flutter_todo/style/BaseStyle.dart';

class AllItem extends StatefulWidget {
  final String id;
  final String title;
  final String content;
  final bool isCheck;

  const AllItem(this.id, this.title, this.content, {this.isCheck});

  @override
  State<StatefulWidget> createState() => AllState();
}

class AllState extends State<AllItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[base, check],
      ),
    );
  }

  /// Is Checked
  Widget get check => Container(
        margin: EdgeInsets.only(right: margin20, top: margin10),
        child: Checkbox(
          onChanged: (bool value) {
            return value;
          },
          value: widget.isCheck,
        ),
      );

  /// Base
  Widget get base => Expanded(
      child: Container(
          margin: EdgeInsets.only(left: margin20, top: margin10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// Title
              Container(
                child: Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),

              /// Content
              Container(
                child: Text(widget.content),
              ),
            ],
          )));
}
