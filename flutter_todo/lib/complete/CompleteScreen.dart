import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo/item/HomeItem.dart';

class CompleteScreen extends StatefulWidget {
  final List<HomeItem> list;

  CompleteScreen(this.list);

  @override
  State<StatefulWidget> createState() => CompleteState();
}

class CompleteState extends State<CompleteScreen> {
  List<HomeItem> completeList = [];

  final completeStream = StreamController<List<HomeItem>>();

  @override
  void initState() {
    super.initState();
    for (var item in widget.list) {
      if (item.item.isChecked) {
        completeList.add(item);
      }
    }

    Future.delayed(Duration(milliseconds: 50),
        () => completeStream.sink.add(completeList));
  }

  @override
  void dispose() {
    super.dispose();
    completeStream.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
      stream: completeStream.stream,
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
