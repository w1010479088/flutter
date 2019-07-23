import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/business/Requestor.dart';
import 'package:flutter_app/model/BlockMeta.dart';
import 'package:flutter_app/pages/BlockPage.dart';
import 'package:flutter_app/util/LogUtil.dart';
import 'package:flutter_app/widgets/WidgetUtil.dart';

const URL_IMAGE =
    "http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg";

class StateBlock extends State<BlockPage> with SingleTickerProviderStateMixin {
  List<Widget> mViews = new List();

  StateBlock(){
    refresh();
  }

  @override
  void initState() {
    super.initState();
//    Requestor.special(1088, 1, (BlockMeta res) {
//      LogUtil.log("Requestor End");
//      refresh();
//    }, (err) {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  void refresh(){
    LogUtil.log("Refresh Start");
    mViews.add(WidgetUtil.image(URL_IMAGE));
    setState(() {
      LogUtil.log("Refresh End ${mViews.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      scrollDirection: Axis.vertical,
      controller: new ScrollController(),
      shrinkWrap: true,
      dragStartBehavior: DragStartBehavior.down,
      children: mViews,
    );
  }
}
