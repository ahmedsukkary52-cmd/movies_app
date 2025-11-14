class UpdateProfileResponse {
  String? message;
  String? error;
  int? statusCode;

  UpdateProfileResponse({this.message, this.error, this.statusCode});

  UpdateProfileResponse.fromJson(dynamic json) {
    message = json["message"];
    error = json["error"];
    statusCode = json["statusCode"];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["message"] = message;
    map["error"] = error;
    map["statusCode"] = statusCode;
    return map;
  }
}
