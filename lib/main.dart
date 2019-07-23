import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/HomePage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        primaryColorLight: Colors.blue,
        primaryColorDark: Colors.green,
        canvasColor: Colors.purple,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),

    );
  }
}


