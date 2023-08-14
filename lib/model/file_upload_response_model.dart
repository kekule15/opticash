// To parse this JSON data, do
//
//     final fileUploadResponseModel = fileUploadResponseModelFromJson(jsonString);

import 'dart:convert';

FileUploadResponseModel? fileUploadResponseModelFromJson(String str) => FileUploadResponseModel.fromJson(json.decode(str));

String fileUploadResponseModelToJson(FileUploadResponseModel? data) => json.encode(data!.toJson());

class FileUploadResponseModel {
    FileUploadResponseModel({
        this.code,
        this.message,
        this.data,
    });

    final int? code;
    final String? message;
    final Data? data;

    factory FileUploadResponseModel.fromJson(Map<String, dynamic> json) => FileUploadResponseModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.filePath,
        this.fileKey,
        this.fileUrl,
    });

    final String? filePath;
    final String? fileKey;
    final String? fileUrl;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        filePath: json["filePath"],
        fileKey: json["fileKey"],
        fileUrl: json["fileUrl"],
    );

    Map<String, dynamic> toJson() => {
        "filePath": filePath,
        "fileKey": fileKey,
        "fileUrl": fileUrl,
    };
}
