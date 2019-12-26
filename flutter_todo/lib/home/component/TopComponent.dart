import 'package:flutter/material.dart';
import 'package:flutter_todo/style/BaseStyle.dart';

class TopComponent extends StatelessWidget {
  /// Callback when tapping left icon
  final Function onLeft;
  /// Callback when tapping right iconn
  final Function onRight;
  /// Left icon
  final Widget leftIcon;
  /// Right icon
  final Widget rightIcon;
  /// Title
  final String title;

  TopComponent(
      {this.onLeft, this.title, this.onRight, this.leftIcon, this.rightIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: topHeight,
      color: topBgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          /// Left icon
          GestureDetector(
              /// Callback when user tapping icon
              onTap: () {
                onLeft();
              },
              child: Container(
                  margin: EdgeInsets.only(left: margin10), child: leftIcon)),
          /// Title
          Text(
            title,
            style: TextStyle(color: whiteColor, fontSize: font16),
          ),
          /// Right icon
          GestureDetector(
              /// Callback when user tapping icon
              onTap: () {
                onRight();
              },
              child: Container(
                  margin: EdgeInsets.only(right: margin10), child: rightIcon)),
        ],
      ),
    );
  }
}
