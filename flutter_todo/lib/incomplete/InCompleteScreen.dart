import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo/item/HomeItem.dart';

class InCompleteScreen extends StatefulWidget {
  final List<HomeItem> list;

  InCompleteScreen(this.list);

  @override
  State<StatefulWidget> createState() => InCompleteState();
}

class InCompleteState extends State<InCompleteScreen> {
  List<HomeItem> inCompleteList = [];
  final inCompleteStream = StreamController<List<HomeItem>>();

  @override
  void initState() {
    super.initState();
    for (var item in widget.list) {
      if (!item.item.isChecked) {
        inCompleteList.add(item);
      }
    }

    Future.delayed(Duration(milliseconds: 50),
        () => inCompleteStream.sink.add(inCompleteList));
  }

  @override
  void dispose() {
    super.dispose();
    inCompleteStream.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
      stream: inCompleteStream.stream,
      builder: (context, snapshot) {
        List<HomeItem> result;
        if (snapshot.data != null && snapshot.hasData) {
          result = snapshot.data;
        } else {
          result = [];
        }

        return result.isNotEmpty
            ? ListView.builder(
                itemCount: result.length,
                itemBuilder: (BuildContext context, int index) =>
                    HomeItem(result[index].item),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
                  ]);
      },
    ));
  }
}
