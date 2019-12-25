import 'package:flutter/material.dart';
import 'package:flutter_todo/home/HomeScreen.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String appName = 'To Do App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,

      body: SplashScreen(
          seconds: 3,
          navigateAfterSeconds: HomeScreen(appName),
          title: Text(appName,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.blue[300],
          loaderColor: Colors
              .red), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
