// To parse this JSON data, do
//
//     final professions = professionsFromJson(jsonString);

import 'dart:convert';

Professions professionsFromJson(String str) => Professions.fromJson(json.decode(str));

String professionsToJson(Professions data) => json.encode(data.toJson());

class Professions {
    Professions({
        required this.success,
        required this.data,
    });

    bool success;
    List<ProfessionItem> data;

    factory Professions.fromJson(Map<String, dynamic> json) => Professions(
        success: json["success"],
        data: List<ProfessionItem>.from(json["data"].map((x) => ProfessionItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ProfessionItem {
    ProfessionItem({
        required this.id,
        required this.name,
        required this.slug_name,
    });

    String id;
    String name;
    String slug_name;

    factory ProfessionItem.fromJson(Map<String, dynamic> json) => ProfessionItem(
        id: json["_id"].toString(),
        name: json["name"],
        slug_name: json["slug_name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug_name": slug_name,
    };
}
