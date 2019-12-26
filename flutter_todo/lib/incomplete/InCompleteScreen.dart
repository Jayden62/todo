import 'package:flutter/material.dart';
import 'package:flutter_todo/sharedcomponent/HomeComponent.dart';
import 'package:flutter_todo/model/Note.dart';

class InCompleteScreen extends StatefulWidget {
  /// List contain all items
  final List<Note> list;

  InCompleteScreen(this.list);

  @override
  State<StatefulWidget> createState() => InCompleteState();
}

class InCompleteState extends State<InCompleteScreen>
    with AutomaticKeepAliveClientMixin {
  /// List contain item incomplete
  List<Note> inCompleteList = [];

  @override
  void initState() {
    super.initState();

    /// Find item is being incomplete
    for (var item in widget.list) {
      if (!item.isChecked) {
        inCompleteList.add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    /// Create list contain item is being incomplete
    return Container(
        child: ListView.builder(
            itemCount: inCompleteList.length,
            itemBuilder: (BuildContext context, int index) => HomeComponent(
                  inCompleteList[index],
                  callback: (Note note, bool value) {},
                )));
  }

  @override
  bool get wantKeepAlive => true;
}
