import 'package:flutter/material.dart';
import 'package:flutter_todo/item/HomeItem.dart';

class AllScreen extends StatefulWidget {
  final List<HomeItem> list;

  AllScreen(this.list);

  @override
  State<StatefulWidget> createState() => AllState();
}

class AllState extends State<AllScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.list);
    return Container(
      child: ListView(children: widget.list),
    );
  }
}
