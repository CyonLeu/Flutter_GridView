/**
 * 请求结果返回
 */

class ResultData {
  var data;
  int code;
  String message;
  bool isSuccess;

  ResultData(this.data, this.code, this.message, this.isSuccess);
}