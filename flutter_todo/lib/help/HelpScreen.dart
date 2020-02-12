import 'package:flutter/material.dart';
import 'package:flutter_todo/reason/ReasonScreen.dart';
import 'package:flutter_todo/style/BaseStyle.dart';

class HelpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HelpState();
}

class HelpState extends State<HelpScreen> {
  List<Question> questions = [
    Question('a1', 'A', true),
    Question('b1', 'B', false),
    Question('c1', 'C', false),
    Question('d1', 'D', false),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        return QuestionItem(
          questions[index],
          callback: (Question question, bool value) {
            ///  Question checked
            for (var item in questions) {
              if (item.id == question.id) {
                setState(() {
                  item.checked = value;
                });
              } else {
                setState(() {
                  item.checked = false;
                });
              }
            }

            /// Navigate next page

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReasonScreen(question)));
          },
        );
      },
    ));
  }
}

class QuestionItem extends StatefulWidget {
  final Question item;
  final Function(Question item, bool value) callback;

  QuestionItem(this.item, {this.callback});

  @override
  State<StatefulWidget> createState() => QuestionItemState();
}

class QuestionItemState extends State<QuestionItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
//          widget.callback(widget.item);
        },
        child: Container(
            margin: EdgeInsets.only(left: margin20, top: margin20),
            child: Row(
              children: <Widget>[
                Text(widget.item.title),
                Checkbox(
                  value: widget.item.checked ? true : false,
                  onChanged: (bool value) {
                    widget.callback(widget.item, value);
                  },
                )
              ],
            )));
  }
}

class Question {
  String id;
  String title;
  bool checked;

  Question(this.id, this.title, this.checked);
}
