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

  @override
  void initState() {
    super.initState();
    for (var item in widget.list) {
      if (!item.item.isChecked) {
        inCompleteList.add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: ListView(children: inCompleteList));
  }
}
