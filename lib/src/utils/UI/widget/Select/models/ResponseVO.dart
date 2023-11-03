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
    });

    bool success;
    String data;
    String message;

    factory ResponseVo.fromJson(Map<String, dynamic> json) => ResponseVo(
        success: json["success"],
        data: json["data"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data,
        "message": message,
    };
}
