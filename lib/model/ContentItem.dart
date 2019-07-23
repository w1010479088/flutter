class ContentItem {
  String show_type;
  String show_data;
  String type; // action_type
  String data; // action_data
  int width;
  int height;
  String image;
  String title;
  String reserved;

  static List<ContentItem> listFromJson(dynamic json) {
    List<ContentItem> items = new List();
    for (var jsonItem in json) {
      items.add(ContentItem.itemFromJson(jsonItem));
    }
    return items;
  }

  static ContentItem itemFromJson(dynamic json) {
    ContentItem item = new ContentItem();
    item.show_type = json["show_type"];
    item.show_data = json["show_data"];
    item.type = json["type"];
    item.data = json["data"];
    item.width = json["width"];
    item.height = json["height"];
    item.image = json["image"];
    item.title = json["title"];
    item.reserved = json["reserved"];
    return item;
  }
}
