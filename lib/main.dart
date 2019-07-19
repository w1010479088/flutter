import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class StateHome extends State<HomePage> {
  List<BottomNavigationBarItem> mBars = new List();
  List<DropdownMenuItem<String>> mMenuItems = new List();
  int mCounter = 0;
  int mCurIndex = 1;
  String mSelMenuTitle = "1";

  StateHome(int add) {
    _initBars();
    _initDropDownItems();
  }

  void _initBars() {
    mBars.add(newBar(Icons.add, "添加"));
    mBars.add(newBar(Icons.home, "首页"));
    mBars.add(newBar(Icons.more, "更多"));
  }

  void _initDropDownItems() {
    mMenuItems.add(newItem("1", "第一"));
    mMenuItems.add(newItem("2", "第二"));
    mMenuItems.add(newItem("3", "第三"));
  }

  BottomNavigationBarItem newBar(IconData icon, String title) {
    return new BottomNavigationBarItem(
        icon: new Icon(icon), title: new Text(title));
  }

  DropdownMenuItem<String> newItem(String value, String text) {
    return new DropdownMenuItem<String>(
      value: value,
      child: new Text(text),
    );
  }

  void _incrementCounter() {
    mCounter++;
    refresh();
  }

  void onTabClick(index) {
    mCurIndex = index;
    refresh();
  }

  void onItemSel(index) {
    showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(index),
          content: new Text("大俊子"),
        ).build(context),
    );
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
//            value: mSelMenuTitle,
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

      bottomNavigationBar: BottomNavigationBar(
        items: mBars,
        currentIndex: mCurIndex,
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.white70,
        onTap: onTabClick,
        selectedFontSize: 20,
        unselectedFontSize: 15,
      ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.start,
            ),
            Text(
              '$mCounter',
              style: Theme.of(context).textTheme.display2,
            ),
          ],
        ),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
