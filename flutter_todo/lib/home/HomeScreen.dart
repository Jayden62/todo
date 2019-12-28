import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_todo/all/AllScreen.dart';
import 'package:flutter_todo/complete/CompleteScreen.dart';
import 'package:flutter_todo/home/component/BottomComponent.dart';
import 'package:flutter_todo/incomplete/InCompleteScreen.dart';
import 'package:flutter_todo/model/Note.dart';
import 'package:flutter_todo/home/component/TopComponent.dart';
import 'package:flutter_todo/style/BaseStyle.dart';
import 'package:uuid/uuid.dart';

/// Index of page all
const int PAGE_ALL = 0;

/// Index of page complete
const int PAGE_COMPLETE = 1;

/// Index of page incomplete
const int PAGE_INCOMPLETE = 2;

class HomeScreen extends StatefulWidget {
  final String appName;

  HomeScreen(this.appName);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  final PageController pageController = PageController();
  final tabStream = StreamController<int>.broadcast();
  int value;
  bool isChecked;
  List<Note> list = List();
  final allStream = StreamController<List<Note>>.broadcast();

  @override
  void initState() {
    super.initState();

    for (int index = 1; index < 9; index++) {
      switch (index) {
        case 2:
          isChecked = true;
          break;
        case 4:
          isChecked = true;
          break;
        case 6:
          isChecked = true;
          break;
        case 8:
          isChecked = true;
          break;
        default:
          {
            isChecked = false;
          }
          break;
      }
      list.add(
        Note(
          id: Uuid().v1(),
          title: 'title $index',
          content: 'content $index',
          isChecked: isChecked,
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();

    /// Dispose controller
    pageController.dispose();

    /// Close stream
    tabStream.close();
    allStream.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar,
      body: initBody,
    );
  }

  /// Init body
  Widget get initBody => WillPopScope(
        /// WillPopScope will be disable Back Button on Android
        onWillPop: () async => false,
        child: Container(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            initTop,
            initPages,
            BottomComponent(
              tabStream: tabStream,

              /// Handle event tab icon
              callback: (int tabIndex) {
                pageController.jumpToPage(tabIndex);
              },
            ),
          ],
        )),
      );

  Widget get initTop => TopComponent(title: widget.appName);

  /// Init pages AllScreen, CompleteScreen, InCompleteScreen
  Widget get initPages {
    List<Widget> widgets = [
      AllScreen(
        list,
        updateStream: allStream,

        /// Handle callback from AllScreen
        callback: (Note note) {
          allStream.sink.add(list);
        },
      ),
      CompleteScreen(list),
      InCompleteScreen(list),
    ];
    return Expanded(
        child: PageView(
      onPageChanged: (value) {
        /// Handle page changed
        switch (value) {
          case PAGE_ALL:
            tabStream.sink.add(PAGE_ALL);
            break;
          case PAGE_COMPLETE:
            tabStream.sink.add(PAGE_COMPLETE);
            break;
          case PAGE_INCOMPLETE:
            tabStream.sink.add(PAGE_INCOMPLETE);
            break;
        }
      },
      controller: pageController,
      children: widgets,
    ));
  }

  PreferredSize get initAppBar {
    /// Default appbar is transparent.
    return PreferredSize(
        preferredSize: Size.fromHeight(height0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: elevation0,
        ));
  }
}
