// To parse this JSON data, do
//
//     final municipios = municipiosFromJson(jsonString);

import 'dart:convert';

Municipios municipiosFromJson(String str) => Municipios.fromJson(json.decode(str));

String municipiosToJson(Municipios data) => json.encode(data.toJson());

class Municipios {
    Municipios({
        required this.success,
        required this.data,
    });

    bool success;
    List<MunicipioItem> data;

    factory Municipios.fromJson(Map<String, dynamic> json) => Municipios(
        success: json["success"],
        data: List<MunicipioItem>.from(json["data"].map((x) => MunicipioItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class MunicipioItem {
    MunicipioItem({
        required this.idMunicipio,
        required this.municipio,
        required this.estado,
        required this.departamentoId,
    });

    int idMunicipio;
    String municipio;
    String estado;
    String departamentoId;

    factory MunicipioItem.fromJson(Map<String, dynamic> json) => MunicipioItem(
        idMunicipio: json["id"],
        municipio: json["municipio"].toString(),
        estado: json["estado"].toString(),
        departamentoId: json["departamento_id"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_municipio": idMunicipio,
        "municipio": municipio,
        "estado": estado,
        "departamento_id": departamentoId,
    };
}
