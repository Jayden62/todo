import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo/home/HomeScreen.dart';
import 'package:flutter_todo/home/component/TabComponent.dart';
import 'package:flutter_todo/style/BaseStyle.dart';

class BottomComponent extends StatefulWidget {

  final StreamController<int> tabStream;
  final Function(int tabIndex) callback;

  BottomComponent({this.tabStream, this.callback});

  @override
  State<StatefulWidget> createState() => BottomState();
}

class BottomState extends State<BottomComponent> {

  /// Current tab bottom
  int currentTab = 0;

  @override
  void initState() {

    super.initState();
    /// Event change tab
    widget.tabStream.stream.listen((int tabIndex){
      setState(() {
        currentTab = tabIndex;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height60,
      decoration: swapDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          /// All
          _initAllTab(),

          /// Complete
          _initCompleteTab(),

          /// Incomplete
          _intInCompleteTab()
        ],
      ),
    );
  }

  /// Init all tab
  Widget _initAllTab(){
    return currentTab == 0
        ? TabComponent(
      Text(
        'All',
        style: TextStyle(
            color: tabColor, fontWeight: FontWeight.bold),
      ),
      icon: Icon(
        Icons.list,
        color: tabColor,
      ),
      callback: () {
        widget.callback(PAGE_ALL);
      },
    )
        : TabComponent(
      Text(
        'All',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      icon: Icon(Icons.list),
      callback: () {
        widget.callback(PAGE_ALL);
      },
    );
  }

  /// Init complete tab
  Widget _initCompleteTab(){
    return currentTab == 1
        ? TabComponent(
      Text(
        'Complete',
        style: TextStyle(
            color: tabColor, fontWeight: FontWeight.bold),
      ),
      icon: Icon(
        Icons.check,
        color: tabColor,
      ),
      callback: () {
        widget.callback(PAGE_COMPLETE);
      },
    )
        : TabComponent(
      Text(
        'Complete',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      icon: Icon(Icons.check),
      callback: () {
        widget.callback(PAGE_COMPLETE);
      },
    );
  }

  /// Init incomplete tab
  Widget _intInCompleteTab(){
    return currentTab == 2
        ? TabComponent(
      Text(
        'Incomplete',
        style: TextStyle(
            color: tabColor, fontWeight: FontWeight.bold),
      ),
      icon: Icon(
        Icons.error_outline,
        color: tabColor,
      ),
      callback: () {
        widget.callback(PAGE_INCOMPLETE);
      },
    )
        : TabComponent(
      Text(
        'Incomplete',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      icon: Icon(Icons.error_outline),
      callback: () {
        widget.callback(PAGE_INCOMPLETE);
      },
    );
  }
}
