import 'package:flutter_app/model/ContentItem.dart';

class BlockItem {
  List<ContentItem> items;
  String item_title;
  String item_type;
  String bg_type;
  String bg_data;
  bool has_margin;
  double scale;

  static List<BlockItem> listFromJson(dynamic json) {
    List<BlockItem> blocks = new List();
    for (var block in json) {
      blocks.add(itemFromJson(block));
    }
    return blocks;
  }

  static BlockItem itemFromJson(dynamic json) {
    BlockItem block = new BlockItem();
    block.item_title = json["item_title"];
    block.item_type = json["item_type"];
    block.bg_type = json["bg_type"];
    block.bg_data = json["bg_data"];
    block.has_margin = json["has_margin"];
    block.scale = json["scale"] * 1.0;
    block.items = ContentItem.listFromJson(json["items"]);
    return block;
  }
}
