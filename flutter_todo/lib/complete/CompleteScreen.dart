import 'package:flutter/material.dart';
import 'package:flutter_todo/sharedcomponent/HomeComponent.dart';
import 'package:flutter_todo/model/Note.dart';

class CompleteScreen extends StatefulWidget {
  /// List contain all items
  final List<Note> list;

  CompleteScreen(this.list);

  @override
  State<StatefulWidget> createState() => CompleteState();
}

class CompleteState extends State<CompleteScreen> {
  /// List contain item complete
  List<Note> completeList = [];


  @override
  void initState() {
    super.initState();
      _filterComplete();

  }
  /// Filter complete data
  void _filterComplete(){
    /// Find item is being complete
    for (var item in widget.list) {
      if (item.isChecked) {
        completeList.add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print('CompleteState saving state');

    /// Create list contain item is being complete
    return Container(
        child: ListView.builder(
            itemCount: completeList.length,
            itemBuilder: (BuildContext context, int index) => HomeComponent(
                  completeList[index],
                  callback: (Note note, bool value) {

                  },
                )));
  }
}
