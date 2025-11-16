class RegisterResponse {
    final String? message;
    final List<String>? messageList;
    final int? statusCode;
    final String? error;
    final RegisterData? data;
    RegisterResponse({
        this.message,
        this.messageList,
        this.statusCode,
        this.error,
        this.data,
    });
    factory RegisterResponse.fromJson(Map<String, dynamic> json) {
        return RegisterResponse(
            message: json['message'] is String ? json['message'] : null,
            messageList: json['message'] is List
                ? List<String>.from(json['message'])
                : null,
            statusCode: json['statusCode'] as int?,
            error: json['error'] as String?,
            data: json['data'] != null ? RegisterData.fromJson(json['data']) : null,
        );
    }
    Map<String, dynamic> toJson() {
        return {
            'message': message,
            'messageList': messageList,
            'statusCode': statusCode,
            'error': error,
            'data': data?.toJson(),
        };
    }
}
class RegisterData {
    final String email;
    final String password;
    final String name;
    final String phone;
    final int avaterId;
    final String id;
    final String createdAt;
    final String updatedAt;
    final int v;
    RegisterData({
        required this.email,
        required this.password,
        required this.name,
        required this.phone,
        required this.avaterId,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });
    factory RegisterData.fromJson(Map<String, dynamic> json) {
        return RegisterData(
            email: json['email'],
            password: json['password'],
            name: json['name'],
            phone: json['phone'],
            avaterId: json['avaterId'],
            id: json['_id'],
            createdAt: json['createdAt'],
            updatedAt: json['updatedAt'],
            v: json['__v'],
        );
    }
    Map<String, dynamic> toJson() {
        return {
            'email': email,
            'password': password,
            'name': name,
            'phone': phone,
            'avaterId': avaterId,
            '_id': id,
            'createdAt': createdAt,
            'updatedAt': updatedAt,
            '__v': v,
        };
    }
}
