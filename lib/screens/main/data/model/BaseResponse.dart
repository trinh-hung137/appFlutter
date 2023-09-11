class BaseResponse {
  int? errorCode;
  String? errorMessage;

  BaseResponse({this.errorCode, this.errorMessage});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      errorCode: json['errorCode'] != null ? json['errorCode'] : -1,
      errorMessage: json['errorMessage'] != null ? json['errorMessage'] : "",
    );
  }
}
