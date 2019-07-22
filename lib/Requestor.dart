import 'dart:collection';
import 'package:flutter_app/HttpHelper.dart';

class Requestor {
  static special(specialId, curPage, success, err) {
    Map<String, String> params = new HashMap();
    params["act"] = "special";
    params["op"] = "index";
    params["page"] = 10.toString();
    params["special_id"] = specialId.toString();
    params["curpage"] = curPage.toString();
    HttpHelper.get(params, success, err);
  }
}
