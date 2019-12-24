import 'package:flutter/material.dart';
import 'package:flutter_todo/stateless/TopStateless.dart';
import 'package:flutter_todo/style/BaseStyle.dart';

class HomeScreen extends StatefulWidget {
  final String appName;

  HomeScreen(this.appName);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar,
      body: initBody,
      bottomNavigationBar: initBottomNavigationBar,
    );
  }

  Widget get initBottomNavigationBar => BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check),
            title: Text('ALL'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            title: Text('CHECK'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error_outline),
            title: Text('UNCHECK'),
          )
        ],
      );

  Widget get initBody => WillPopScope(
        /// WillPopScope will be unable Back Button on Android
        onWillPop: () async => false,
        child: Container(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            initTop,
            initPages,
          ],
        )),
      );

  Widget get initTop => TopStateless(title: widget.appName);

  Widget get initPages => Expanded(
        child: PageView(),
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
