
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/states/StateMain.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  String title;

  MainPage({Key key, title}) : super(key: key) {
    this.title = title;
  }

  @override
  StateMain createState(){
    return new StateMain(5);
  }
}