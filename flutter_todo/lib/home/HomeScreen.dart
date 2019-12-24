import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo/all/AllScreen.dart';
import 'package:flutter_todo/check/CheckScreen.dart';
import 'package:flutter_todo/stateless/TabStateless.dart';
import 'package:flutter_todo/stateless/TopStateless.dart';
import 'package:flutter_todo/style/BaseStyle.dart';
import 'package:flutter_todo/uncheck/UnCheckScreen.dart';

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

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 50), () {
      tabStream.sink.add(0);
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    tabStream.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar,
      body: initBody,
    );
  }

  Widget get initBody => WillPopScope(
        /// WillPopScope will be unable Back Button on Android
        onWillPop: () async => false,
        child: Container(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            initTop,
            initPages,
            initBottom,
          ],
        )),
      );

  Widget get initTop => TopStateless(title: widget.appName);

  Widget get initPages {
    List<Widget> widgets = [
      AllScreen(),
      CheckScreen(),
      UnCheckScreen(),
    ];
    return Expanded(
        child: PageView(
      onPageChanged: (value) {
        switch (value) {
          case 0:
            tabStream.sink.add(0);
            break;
          case 1:
            tabStream.sink.add(1);
            break;
          case 2:
            tabStream.sink.add(2);
            break;
        }
      },
      controller: pageController,
      children: widgets,
    ));
  }

  Widget get initBottom => Container(
        height: height60,
        decoration: swapDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            /// All
            StreamBuilder(
              stream: tabStream.stream,
              builder: (context, snapshot) {
                if (snapshot.data != null && snapshot.hasData) {
                  value = snapshot.data;
                } else {
                  value = -1;
                }

                return value == 0
                    ? TabStateless(
                        Text(
                          'ALL',
                          style: TextStyle(
                              color: tabColor, fontWeight: FontWeight.bold),
                        ),
                        icon: Icon(
                          Icons.list,
                          color: tabColor,
                        ),
                        onTap: () {
                          tabStream.sink.add(0);
                          pageController.jumpToPage(0);
                        },
                      )
                    : TabStateless(
                        Text(
                          'ALL',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        icon: Icon(Icons.list),
                        onTap: () {
                          tabStream.sink.add(0);
                          pageController.jumpToPage(0);
                        },
                      );
              },
            ),

            /// Check
            StreamBuilder(
              stream: tabStream.stream,
              builder: (context, snapshot) {
                if (snapshot.data != null && snapshot.hasData) {
                  value = snapshot.data;
                } else {
                  value = -1;
                }

                return value == 1
                    ? TabStateless(
                        Text(
                          'CHECK',
                          style: TextStyle(
                              color: tabColor, fontWeight: FontWeight.bold),
                        ),
                        icon: Icon(
                          Icons.check,
                          color: tabColor,
                        ),
                        onTap: () {
                          tabStream.sink.add(1);
                          pageController.jumpToPage(1);
                        },
                      )
                    : TabStateless(
                        Text(
                          'CHECK',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        icon: Icon(Icons.check),
                        onTap: () {
                          tabStream.sink.add(1);
                          pageController.jumpToPage(1);
                        },
                      );
              },
            ),

            /// Uncheck
            StreamBuilder(
              stream: tabStream.stream,
              builder: (context, snapshot) {
                if (snapshot.data != null && snapshot.hasData) {
                  value = snapshot.data;
                } else {
                  value = -1;
                }

                return value == 2
                    ? TabStateless(
                        Text(
                          'UNNCHECK',
                          style: TextStyle(
                              color: tabColor, fontWeight: FontWeight.bold),
                        ),
                        icon: Icon(
                          Icons.error_outline,
                          color: tabColor,
                        ),
                        onTap: () {
                          tabStream.sink.add(2);
                          pageController.jumpToPage(2);
                        },
                      )
                    : TabStateless(
                        Text(
                          'UNNCHECK',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        icon: Icon(Icons.error_outline),
                        onTap: () {
                          tabStream.sink.add(2);
                          pageController.jumpToPage(2);
                        },
                      );
              },
            ),
          ],
        ),
      );

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
