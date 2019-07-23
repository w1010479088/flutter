import 'package:flutter/cupertino.dart';
import 'package:flutter_app/states/StateBlock.dart';
import 'package:flutter_app/util/LogUtil.dart';

class BlockPage extends StatefulWidget {
  State mState;

  BlockPage() {
    //TODO 为啥用mState不行
    LogUtil.log("Constructor");
    mState = new StateBlock();
  }

  @override
  State<StatefulWidget> createState() {
    LogUtil.log("BlockPage -> CreateState = ${mState != null}");
    return new StateBlock();
  }
}
