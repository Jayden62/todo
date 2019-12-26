import 'package:flutter_todo/sharedcomponent/HomeComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/model/Note.dart';

class AllScreen extends StatefulWidget {
  final List<Note> list;

  AllScreen(this.list);

  @override
  State<StatefulWidget> createState() => AllState();
}

class AllState extends State<AllScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (BuildContext context, int index) => HomeComponent(
        widget.list[index],
        callback: (Note note, bool value) {
          /// Handle call back
          Note found;
          for (var element in widget.list) {
            /// Call back from item, i will compare item selected to all off items in list via id.
            /// If matched, it will be assigned.
            if (element.id == note.id) {
              found = element;
              break;
            }
          }

          if (found != null) {
            found.isChecked = value;
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
