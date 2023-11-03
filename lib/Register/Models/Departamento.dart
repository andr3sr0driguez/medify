// To parse this JSON data, do
//
//     final departamento = departamentoFromJson(jsonString);

import 'dart:convert';

Departamento departamentoFromJson(String str) => Departamento.fromJson(json.decode(str));

String departamentoToJson(Departamento data) => json.encode(data.toJson());

class Departamento {
    Departamento({
        required this.success,
        required this.data,
    });

    bool success;
    List<DepartamentoItem> data;

    factory Departamento.fromJson(Map<String, dynamic> json) => Departamento(
        success: json["success"],
        data: List<DepartamentoItem>.from(json["data"].map((x) => DepartamentoItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DepartamentoItem {
    DepartamentoItem({
        required this.idDepartamento,
        required this.departamento,
    });

    String idDepartamento;
    String departamento;

    factory DepartamentoItem.fromJson(Map<String, dynamic> json) => DepartamentoItem(
        idDepartamento: json["id"].toString(),
        departamento: json["departamento"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_departamento": idDepartamento,
        "departamento": departamento,
    };
}
