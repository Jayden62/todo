
import 'package:flutter_todo/sharedcomponent/HomeComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/model/Note.dart';

class AllScreen extends StatefulWidget {
  final List<Note> list;
  final Function(Note note) callback;

  AllScreen(this.list, {this.callback});

  @override
  State<StatefulWidget> createState() => AllState();
}

class AllState extends State<AllScreen> {

  @override
  Widget build(BuildContext context) {

    print('AllState saving state');

      if(widget.list == null || widget.list.isEmpty){
        return Container();
      }
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (BuildContext context, int index) => HomeComponent(
        widget.list[index],
        callback: (Note note, bool value) {
            /// Callback {found} outside HomeScreen
            widget.callback(note);
        },
      ),
    );
  }
}
