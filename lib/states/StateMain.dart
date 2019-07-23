import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/BlockPage.dart';
import 'package:flutter_app/pages/MainPage.dart';
import 'package:flutter_app/util/AlertUtil.dart';
import 'package:flutter/gestures.dart';

class StateMain extends State<MainPage> with SingleTickerProviderStateMixin {
  List<Widget> mTabBars = new List();
  List<DropdownMenuItem<String>> mMenuItems = new List();
  int mCounter = 0;
  int mCurIndex = 1;
  String mSelMenuTitle = "1";
  TabController tabController;

  StateMain(int add) {
    _initBars();
    _initDropDownItems();
  }

  @override
  void initState() {
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
        backgroundColor: Colors.black,
        leading: new BackButton(
          color: Colors.white,
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
              color: Colors.white,
            ),
            onChanged: onItemSel,
          )
        ],
        title: new Text(
          widget.title,
          softWrap: true,
          style: new TextStyle(color: Colors.white),
          textAlign: TextAlign.right,
          overflow: TextOverflow.clip,
        ),
        primary: true,
      ),
      body: new TabBarView(
        dragStartBehavior: DragStartBehavior.down,
        controller: this.tabController,
        children: <Widget>[
          new BlockPage(),
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