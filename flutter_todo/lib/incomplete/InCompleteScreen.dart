import 'package:flutter/material.dart';
import 'package:flutter_todo/sharedcomponent/HomeComponent.dart';
import 'package:flutter_todo/model/Note.dart';

class InCompleteScreen extends StatefulWidget {

  /// List contain all items
  final List<HomeComponent> list;

  InCompleteScreen(this.list);

  @override
  State<StatefulWidget> createState() => InCompleteState();

}

class InCompleteState extends State<InCompleteScreen> with AutomaticKeepAliveClientMixin{

  /// List contain item incomplete
  List<HomeComponent> inCompleteList = [];

  @override
  void initState() {
    super.initState();
    /// Find item is being incomplete
    for (var item in widget.list) {
      if (!item.item.isChecked) {
        inCompleteList.add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('InCompleteScreen call build');
    /// Create list contain item is being incomplete
    return Container(
        child: ListView.builder(
            itemCount: inCompleteList.length,
            itemBuilder: (BuildContext context, int index) => HomeComponent(
                  inCompleteList[index].item,
                  callback: (Note note, bool value) {},
                )));
  }

  @override
  bool get wantKeepAlive => true;
}
