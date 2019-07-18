import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  StateHome createState() => StateHome(5);
}

class StateHome extends State<HomePage>{

  StateHome(int add){
    init();
  }

  int _counter = 0;
  int mCurIndex = 1;
  List<BottomNavigationBarItem> bars = new List(3);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void init(){
    bars.add(BottomNavigationBarItem(
        icon: Icon(Icons.add),
        title: Text("添加"),
        activeIcon: Icon(Icons.add_alert)
    ));
    bars.add(BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("首页"),
        activeIcon: Icon(Icons.add_to_home_screen)
    ));
    bars.add(BottomNavigationBarItem(
        icon: Icon(Icons.more),
        title: Text("更多"),
        activeIcon: Icon(Icons.more_horiz)
    ));
  }

  void onTabClick(index){
    mCurIndex = index;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: false,
        toolbarOpacity: 1,
        elevation: 20,
        bottomOpacity: 1,
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bars,
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
              '$_counter',
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
        child: Icon(Icons.add,size: 30,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
