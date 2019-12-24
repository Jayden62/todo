import 'package:flutter/material.dart';
import 'package:flutter_todo/style/BaseStyle.dart';

class TabStateless extends StatelessWidget {
  final Function onTap;
  final Widget icon;
  final Widget text;

  TabStateless(this.text, {this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
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
