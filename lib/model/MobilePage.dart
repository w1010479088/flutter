class MobilePage {
  bool hasmore;
  int page_total;

  static MobilePage fromJson(dynamic json) {
    MobilePage page = new MobilePage();
    page.hasmore = json["hasmore"];
    page.page_total = json["page_total"];
    return page;
  }
}
