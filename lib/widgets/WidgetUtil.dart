import 'package:flutter/material.dart';

class WidgetUtil {
  static Widget image(String url) {
    return new Image(
      image: new NetworkImage(
        url,
        scale: 0.5
      ),
    );
  }
}
