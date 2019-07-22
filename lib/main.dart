import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/AlertUtil.dart';
import 'package:flutter_app/JsonUtil.dart';
import 'package:flutter_app/LogUtil.dart';
import 'package:flutter_app/Requestor.dart';

import 'AppConfigs.dart';
import 'ResponseModel.dart';

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

class HomePage extends StatefulWidget {
  String title;

  HomePage({Key key, title}) : super(key: key) {
    this.title = title;
  }

  @override
  StateHome createState() => StateHome(5);
}

class StateHome extends State<HomePage> with SingleTickerProviderStateMixin {
  List<Widget> mTabBars = new List();
  List<DropdownMenuItem<String>> mMenuItems = new List();
  int mCounter = 0;
  int mCurIndex = 1;
  String mSelMenuTitle = "1";
  TabController tabController;

  StateHome(int add) {
    _initBars();
    _initDropDownItems();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _initBars() {
    mTabBars.add(newBar(Icons.add, "添加"));
    mTabBars.add(newBar(Icons.home, "首页"));
    mTabBars.add(newBar(Icons.more, "更多"));
  }

  void _initDropDownItems() {
    mMenuItems.add(newItem("1", "第一"));
    mMenuItems.add(newItem("2", "第二"));
    mMenuItems.add(newItem("3", "第三"));
  }

  Widget newBar(IconData icon, String title) {
    return new Tab(text: title, icon: new Icon(icon));
  }

  DropdownMenuItem<String> newItem(String value, String text) {
    return new DropdownMenuItem<String>(
      value: value,
      child: new Text(text),
    );
  }

  void _incrementCounter() {
    mCounter++;
    Requestor.special(1088, 1, (res) {
      LogUtil.log(res.toString());
//      ResponseModel response = JsonUtil.convert<ResponseModel>(res);
//      String message = response.message;
    }, (err) => {LogUtil.log(err)});
    refresh();
  }

  void onTabClick(index) {
    mCurIndex = index;
    tabController.animateTo(index);
    refresh();
  }

  void onItemSel(index) {
    AlertUtil.show(context, index, "大俊子");
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarOpacity: 1,
        elevation: 10,
        bottomOpacity: 0.3,
        backgroundColor: Colors.green,
        leading: new BackButton(
          color: Colors.black,
        ),
        actions: <Widget>[
          new DropdownButton<String>(
            items: mMenuItems,
            iconSize: 30,
            underline: new Text(
              "",
              maxLines: 1,
            ),
            icon: new Icon(
              Icons.add,
              color: Colors.red,
            ),
            onChanged: onItemSel,
          )
        ],
        title: Text(
          widget.title,
          softWrap: true,
          textAlign: TextAlign.right,
          overflow: TextOverflow.clip,
        ),
        primary: true,
      ),
      body: new TabBarView(
        dragStartBehavior: DragStartBehavior.down,
        controller: this.tabController,
        children: <Widget>[
          new Text("Page A"),
          new Text("Page B"),
          new Text("Page C"),
        ],
      ),
      bottomNavigationBar: new TabBar(
        tabs: mTabBars,
        controller: this.tabController,
        isScrollable: false,
        labelColor: Colors.green,
        indicatorColor: Colors.transparent,
        unselectedLabelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        clipBehavior: Clip.hardEdge,
        elevation: 5,
        mini: false,
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
