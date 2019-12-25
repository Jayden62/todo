import 'package:flutter/material.dart';
import 'package:flutter_todo/item/AllItem.dart';
import 'package:uuid/uuid.dart';

class AllScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AllState();
}

class AllState extends State<AllScreen> {
  var uuid = Uuid();
  String noteId;

  @override
  void initState() {
    super.initState();
    noteId = uuid.v1();
    if (noteId == null) {
      noteId = 'unknow ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          AllItem(
            noteId,
            'title',
            'content',
            isCheck: true,
          ),
        ],
      ),
    );
  }
}
