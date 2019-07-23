import 'dart:convert';
import 'package:flutter_app/model/BlockItem.dart';
import 'package:flutter_app/model/MobilePage.dart';
import 'package:flutter_app/model/Summary.dart' as prefix0;
import 'package:flutter_app/util/LogUtil.dart';

class BlockMeta {
  List<BlockItem> special_list;
  List<prefix0.Summary> summary;
  MobilePage mobile_page;

  static BlockMeta fromJson(String jsonStr) {
    Map<String, dynamic> json = jsonDecode(jsonStr);
    Map<String, dynamic> jsonDatas = json["datas"];
    BlockMeta meta = new BlockMeta();
    meta.special_list = BlockItem.listFromJson(jsonDatas["special_list"]);
    meta.summary = prefix0.Summary.listFromJson(jsonDatas["summary"]);
    meta.mobile_page = MobilePage.fromJson(jsonDatas["mobile_page"]);
    return meta;
  }
}
