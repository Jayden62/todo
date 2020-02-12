import 'dart:async';

import 'package:flutter_todo/sharedcomponent/HomeComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/model/Note.dart';

class AllScreen extends StatefulWidget {
  final List<Note> list;
  final Function(Note note) callback;
  final StreamController updateStream;

  AllScreen(this.list, {this.callback, this.updateStream});

  @override
  State<StatefulWidget> createState() => AllState();
}

class AllState extends State<AllScreen> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 30), () {
      widget.updateStream.sink.add(widget.list);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('AllState saving state');

    return StreamBuilder(
      stream: widget.updateStream.stream,
      builder: (context, snapshot) {
        List<Note> result;
        if (snapshot.data != null && snapshot.hasData) {
          result = snapshot.data;
        } else {
          result = [];
        }
        return _getData(result);
      },
    );
  }

  Widget _getData(List<Note> data) => data.isNotEmpty
      ? ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) => HomeComponent(
            data[index],
            callback: (Note note, bool value) {
              /// Handle call back
              Note found;
              for (var item in data) {
                /// Call back from item, i will compare item selected to all of items in list via compare object.
                /// If matched, it will be assigned.
                if (item == note) {
                  found = item;
                  break;
                }
              }

              if (found != null) {
                found.isChecked = value;

                /// Callback {found} outside HomeScreen
                widget.callback(found);
              }
            },
          ),
        )
      : Container();

  @override
  bool get wantKeepAlive => true;
}
