class UpdateProfileRequest {
  String? email;
  int? avatarId;
  String? name;
  String? phone;

  UpdateProfileRequest({this.email, this.avatarId, this.name, this.phone});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (email != null) map['email'] = email;
    if (avatarId != null) map['avaterId'] = avatarId;
    if (name != null) map['name'] = name;
    if (phone != null) map['phone'] = phone;

    return map;
  }
}
