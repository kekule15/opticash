// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    String? status;
    Data? data;
    Meta? meta;

    UserResponse({
        this.status,
        this.data,
        this.meta,
    });

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "meta": meta?.toJson(),
    };
}

class Data {
    String? accessToken;
    UserData? user;

    Data({
        this.accessToken,
        this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
        user: json["user"] == null ? null : UserData.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "user": user?.toJson(),
    };
}

class UserData {
    String? firstName;
    String? lastName;
    String? userName;
    String? email;

    UserData({
        this.firstName,
        this.lastName,
        this.userName,
        this.email,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        firstName: json["first_name"],
        lastName: json["last_name"],
        userName: json["user_name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "user_name": userName,
        "email": email,
    };
}

class Meta {
    Meta();

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    );

    Map<String, dynamic> toJson() => {
    };
}
