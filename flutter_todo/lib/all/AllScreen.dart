import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo/item/HomeItem.dart';
import 'package:flutter_todo/model/Note.dart';

class AllScreen extends StatefulWidget {
  final List<HomeItem> list;

  AllScreen(this.list);

  @override
  State<StatefulWidget> createState() => AllState();
}

class AllState extends State<AllScreen> {
  final allStream = StreamController<List<HomeItem>>.broadcast();

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(milliseconds: 50), () => allStream.sink.add(widget.list));
  }

  @override
  void dispose() {
    super.dispose();
    allStream.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: allStream.stream,
      builder: (context, snapshot) {
        List<HomeItem> result;
        if (snapshot.data != null && snapshot.hasData) {
          result = snapshot.data;
        } else {
          result = [];
        }

        return result.isEmpty
            ? Container()
            : ListView.builder(
                itemCount: result.length,
                itemBuilder: (BuildContext context, int index) => HomeItem(
                  result[index].item,
                  callback: (Note note, bool value) {
                    /// Handle call back
                    Note found;
                    for (var element in widget.list) {
                      if (element.item.id == note.id) {
                        found = element.item;
                        break;
                      }
                    }

                    if (found != null) {
                      found.isChecked = value;
                      allStream.sink.add(widget.list);
                    }
                    allStream.sink.add(widget.list);
                  },
                ),
              );
      },
    );
  }
}
