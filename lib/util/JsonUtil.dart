import 'dart:convert';

class JsonUtil {
  static convert<T>(String content) {
    return new JsonDecoder().convert(content) as T;
  }
}
