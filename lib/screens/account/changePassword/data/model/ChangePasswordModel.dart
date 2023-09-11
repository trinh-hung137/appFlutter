class ErrorMessageChangePassword {
  ErrorMessageChangePassword({
    this.errorCode,
    this.errorMessage = "",
  });

  String errorMessage;
  int? errorCode;
  factory ErrorMessageChangePassword.fromJson(Map<String, dynamic> json) {
    print(json['errorCode']);
    // var errorCode = json['errorCode'];
    // var errorMessage = json['errorMessage'];
    return ErrorMessageChangePassword(
      errorCode: json['errorCode'] != null ? json['errorCode'] : 0,
      errorMessage: json['errorMessage'] != null ? json['errorMessage'] : "",
    );
  }
}
