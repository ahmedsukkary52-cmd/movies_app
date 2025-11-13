import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
    RegisterResponse({
        this.data,       // ممكن تكون null لو في error
        this.message,    // ممكن تكون String أو List<String>
        this.error,      // رسالة الخطأ لو فيه
        this.statusCode, // statusCode لو فيه
    });

    Data? data;
    dynamic message;
    String? error;
    int? statusCode;

    factory RegisterResponse.fromJson(Map<dynamic, dynamic> json) =>
        RegisterResponse(
            data: json["data"] != null ? Data.fromJson(json["data"]) : null,
            message: json["message"],
            error: json["error"],
            statusCode: json["statusCode"],
        );

    Map<dynamic, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "error": error,
        "statusCode": statusCode,
    };
}

class Data {
    Data({
        required this.createdAt,
        required this.password,
        required this.phone,
        required this.v,
        required this.name,
        required this.avaterId,
        required this.id,
        required this.email,
        required this.updatedAt,
    });

    DateTime createdAt;
    String password;
    String phone;
    int v;
    String name;
    int avaterId;
    String id;
    String email;
    DateTime updatedAt;

    factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        createdAt: DateTime.parse(json["createdAt"]),
        password: json["password"],
        phone: json["phone"],
        v: json["__v"],
        name: json["name"],
        avaterId: json["avaterId"],
        id: json["_id"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "password": password,
        "phone": phone,
        "__v": v,
        "name": name,
        "avaterId": avaterId,
        "_id": id,
        "email": email,
        "updatedAt": updatedAt.toIso8601String(),
    };
}
