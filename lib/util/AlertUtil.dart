import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class AlertUtil {
  static show(context, title, content) {
    showDialog(
        context: context,
        child: new prefix0.AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: <Widget>[
            new CloseButton(),
          ],
        ).build(context));
  }
}
