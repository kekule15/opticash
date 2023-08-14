// To parse this JSON data, do
//
//     final customerNotificationModel = customerNotificationModelFromJson(jsonString);

import 'dart:convert';

CustomerNotificationModel customerNotificationModelFromJson(String str) => CustomerNotificationModel.fromJson(json.decode(str));

String customerNotificationModelToJson(CustomerNotificationModel data) => json.encode(data.toJson());

class CustomerNotificationModel {
    CustomerNotificationModel({
        this.code,
        this.message,
        this.data,
    });

    final int? code;
    final String? message;
    final Data? data;

    factory CustomerNotificationModel.fromJson(Map<String, dynamic> json) => CustomerNotificationModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        this.notificationCount,
        this.notifications,
    });

    final int? notificationCount;
    final List<CustomerNotification>? notifications;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        notificationCount: json["notification_count"],
        notifications: json["notifications"] == null ? [] : List<CustomerNotification>.from(json["notifications"]!.map((x) => CustomerNotification.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "notification_count": notificationCount,
        "notifications": notifications == null ? [] : List<dynamic>.from(notifications!.map((x) => x.toJson())),
    };
}

class CustomerNotification {
    CustomerNotification({
        this.id,
        this.notificationType,
        this.timer,
        this.account,
        this.subject,
        this.message,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    final String? id;
    final String? notificationType;
    final String? timer;
    final String? account;
    final String? subject;
    final String? message;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;

    factory CustomerNotification.fromJson(Map<String, dynamic> json) => CustomerNotification(
        id: json["_id"],
        notificationType: json["notification_type"],
        timer: json["timer"],
        account: json["account"],
        subject: json["subject"],
        message: json["message"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "notification_type": notificationType,
        "timer": timer,
        "account": account,
        "subject": subject,
        "message": message,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
