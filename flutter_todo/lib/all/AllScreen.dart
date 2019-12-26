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

    /// Because of on UI the stream controller is not finished right at that time.
    /// Use delayed {milliseconds: 50} to be waiting up stream shoot back and render UI.
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
                      /// Call back from item, i will compare item selected to all off items in list via id.
                      /// If matched, i will assign and refresh list.
                      if (element.item.id == note.id) {
                        found = element.item;
                        break;
                      }
                    }

                    if (found != null) {
                      found.isChecked = value;
                      allStream.sink.add(widget.list);
                    }
                  },
                ),
              );
      },
    );
  }
}
