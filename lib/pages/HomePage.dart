
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/states/StateHome.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String title;

  HomePage({Key key, title}) : super(key: key) {
    this.title = title;
  }

  @override
  StateHome createState(){
    return new StateHome(5);
  }
}