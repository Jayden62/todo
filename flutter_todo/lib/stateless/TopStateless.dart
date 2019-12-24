import 'package:flutter/material.dart';
import 'package:flutter_todo/style/BaseStyle.dart';

class TopStateless extends StatelessWidget {
  final Function onLeft;
  final Function onRight;
  final Widget leftIcon;
  final Widget rightIcon;
  final String title;

  TopStateless(
      {this.onLeft, this.title, this.onRight, this.leftIcon, this.rightIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: topHeight,
      color: topBgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                onLeft();
              },
              child: Container(
                  margin: EdgeInsets.only(left: margin10), child: rightIcon)),
          Text(
            title,
            style: TextStyle(color: whiteColor, fontSize: font16),
          ),
          GestureDetector(
              onTap: () {
                onRight();
              },
              child: Container(
                  margin: EdgeInsets.only(right: margin10), child: leftIcon)),
        ],
      ),
    );
  }
}
