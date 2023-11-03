// To parse this JSON data, do
//
//     final tiposDocumentos = tiposDocumentosFromJson(jsonString);

import 'dart:convert';

TiposDocumentos tiposDocumentosFromJson(String str) => TiposDocumentos.fromJson(json.decode(str));

String tiposDocumentosToJson(TiposDocumentos data) => json.encode(data.toJson());

class TiposDocumentos {
    TiposDocumentos({
        required this.success,
        required this.data,
    });

    bool success;
    List<TipoDocumento> data;

    factory TiposDocumentos.fromJson(Map<String, dynamic> json) => TiposDocumentos(
        success: json["success"],
        data: List<TipoDocumento>.from(json["data"].map((x) => TipoDocumento.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class TipoDocumento {
    TipoDocumento({
        required this.id,
        required this.name,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    dynamic deletedAt;
    dynamic createdAt;
    dynamic updatedAt;

    factory TipoDocumento.fromJson(Map<String, dynamic> json) => TipoDocumento(
        id: json["id"],
        name: json["name"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
