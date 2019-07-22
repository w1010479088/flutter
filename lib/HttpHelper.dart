import 'package:dio/dio.dart';
import 'package:flutter_app/AppConfigs.dart';

class HttpHelper {

  static get(params, success, err) async {
    Dio dio = new Dio();
    dio.options.baseUrl = AppConfigs.host();
    dio.options.connectTimeout = AppConfigs.timeOut();
    dio.options.receiveTimeout = AppConfigs.timeOut();
//    params["HPHPSESSID"] = "xxxx";
    params["client_type"] = "android";
    try {
      Response<String> response =
          await dio.get("/mobile/index.php", queryParameters: params);
      success(response.data);
    } on DioError catch (e) {
      err(e);
    }
  }
}
