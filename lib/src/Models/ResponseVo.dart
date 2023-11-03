// To parse this JSON data, do
//
//     final responseVo = responseVoFromJson(jsonString);

import 'dart:convert';

ResponseVo responseVoFromJson(String str) => ResponseVo.fromJson(json.decode(str));

String responseVoToJson(ResponseVo data) => json.encode(data.toJson());

class ResponseVo {
    ResponseVo({
        required this.success,
        required this.data,
        required this.message,
        required this.statusCode,
    });

    bool success;
    String data;
    String message;
    int statusCode;

    factory ResponseVo.fromJson(Map<String, dynamic> json) => ResponseVo(
        success: json["success"],
        data: json["data"]??"",
        message: json["message"]??"",
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data,
        "message": message,
        "statusCode": statusCode,
    };
}
