import 'package:flutter/material.dart';
import 'package:flutter_todo/item/HomeItem.dart';
import 'package:flutter_todo/model/Note.dart';

class CompleteScreen extends StatefulWidget {
  final List<HomeItem> list;

  CompleteScreen(this.list);

  @override
  State<StatefulWidget> createState() => CompleteState();
}

class CompleteState extends State<CompleteScreen> {
  List<HomeItem> completeList = [];

  @override
  void initState() {
    super.initState();
    for (var item in widget.list) {
      if (item.item.isChecked) {
        completeList.add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: completeList.length,
            itemBuilder: (BuildContext context, int index) => HomeItem(
                  completeList[index].item,
                  callback: (Note note, bool value) {},
                )));
  }
}
