import 'package:dio/dio.dart';
import 'package:firstapp/Network/ResultData.dart';

///网络请求
class NetworkManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Map optionParams = {
    "timeoutMs": 15000,
    "token": null,
    "authorizationCode": null,
  };

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  static get(url, params, Map<String, String> header, Options option,
      {noTip = false}) async {
    Map<String, String> headers = new Map();
    if (header != null) {
      headers.addAll(header);
    }

    //授权码
    if (optionParams["token"] == null) {
//      var authorizationCode = await getAuthorization();
//      if (authorizationCode != null) {
//        optionParams["token"] = authorizationCode;
//      }
    }

    headers["token"] = optionParams["token"];
    headers["app-version"] = '7.4.0';

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }

    ///超时
    option.connectTimeout = 30000;
    option.baseUrl = 'http://apis.qupeiyin.com/';

    Dio dio = new Dio();

    Response response;
    try {
      response = await dio.request(url, data: params, options: option);
      print(response);
    } on DioError catch (e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = 300;
      }

      return new ResultData(
          null, errorResponse.statusCode, 'reques fail', false);
    }

    var serverData = response.data;

    String message = serverData['msg'];
//    if (message) {
//      message = serverData['msg'];
//    }

    int statusCode = 0;
    if (serverData['status'] != null) {
      statusCode = serverData['status'];
    }

    var listItems;
    if (serverData['data'] != null) {
      listItems = serverData['data'];
    }

    try {
      if (option.contentType != null &&
          option.contentType.primaryType == "text") {
        return new ResultData(listItems, statusCode, '', true);
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        return new ResultData(listItems, statusCode, '', true);
      }
    } catch (e) {
      print(e.toString() + url);
      return new ResultData(listItems, statusCode, '', true);
    }
    return new ResultData(listItems, statusCode, '', true);
  }
}
