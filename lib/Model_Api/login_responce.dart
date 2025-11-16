class LoginResponse {
  final String? message;
  final String? token;
  final int? statusCode;
  LoginResponse({
    this.message,
    this.token,
    this.statusCode,
  });
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'] as String?,
      token: json['data'] as String?,
      statusCode: json['statusCode'] as int?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
      'statusCode': statusCode,
    };
  }
}
