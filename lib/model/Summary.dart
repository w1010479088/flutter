class Summary {
  int goods_id;
  String goods_mobile_name;
  String goods_image_url;
  double goods_price;
  int goods_storage;

  static List<Summary> listFromJson(dynamic json) {
    List<Summary> list = new List();
    for (var item in json) {
      list.add(itemFromJson(item));
    }
    return list;
  }

  static Summary itemFromJson(dynamic json) {
    Summary item = new Summary();
    item.goods_id = json["goods_id"];
    item.goods_mobile_name = json["goods_mobile_name"];
    item.goods_image_url = json["goods_image_url"];
    item.goods_price = double.parse(json["goods_price"]);
    item.goods_storage = json["goods_storage"];
    return item;
  }
}
