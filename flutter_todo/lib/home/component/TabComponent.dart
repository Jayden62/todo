import 'package:flutter/material.dart';
import 'package:flutter_todo/style/BaseStyle.dart';

class TabComponent extends StatelessWidget {

  /// Callback when user tap icon
  final Function callback;
  /// icon
  final Widget icon;
  /// Text
  final Widget text;

  TabComponent(this.text, {this.icon, this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      /// Handle event tap icon to callback
      onTap: () => callback(),
      highlightColor: whiteColor,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: margin5),
              child: icon,
            ),
            text,
          ],
        ),
      ),
    );
  }
}
