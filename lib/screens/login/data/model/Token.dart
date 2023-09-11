class Token {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  int? expiresIn;

  Token({this.accessToken, this.refreshToken, this.tokenType, this.expiresIn});

  factory Token.fromJson(Map<String, dynamic> json) {
    print("Token.fromJson start");
    var result = json['result'];
    return Token(
      accessToken: result != null ? result['access_token'] : "",
      refreshToken: result != null ? result['refresh_token'] : "",
      tokenType: result != null ? result['token_type'] : "",
      expiresIn: result != null ? result[' expires_in'] : 0,
    );
  }
}
