import 'package:flutter/material.dart';
import 'package:flutter_todo/home/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appName = 'To do App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(appName),
    );
  }
}
