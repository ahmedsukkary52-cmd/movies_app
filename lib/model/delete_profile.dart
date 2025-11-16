class DeleteProfileResponse {
  String? message;

  DeleteProfileResponse({this.message});

  DeleteProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}
