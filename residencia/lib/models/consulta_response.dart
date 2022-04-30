// To parse this JSON data, do
//
//     final consultaResponse = consultaResponseFromMap(jsonString);

import 'dart:convert';

class ConsultaResponse {
  ConsultaResponse({
    required this.id,
    required this.codigo,
    required this.documento,
    required this.numero,
    required this.nombre,
    required this.correo,
    required this.direccion,
    required this.celular,
    required this.archivo,
    required this.estado,
    required this.observaciones,
    required this.soportes,
    required this.usuario,
    required this.vigencia,
    required this.vencimiento,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String codigo;
  int documento;
  String numero;
  String nombre;
  String correo;
  String direccion;
  String celular;
  String archivo;
  int estado;
  String observaciones;
  dynamic soportes;
  int usuario;
  int vigencia;
  dynamic vencimiento;
  DateTime createdAt;
  DateTime updatedAt;

  factory ConsultaResponse.fromJson(String str) => ConsultaResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConsultaResponse.fromMap(Map<String, dynamic> json) => ConsultaResponse(
        id: json["id"],
        codigo: json["codigo"],
        documento: json["documento"],
        numero: json["numero"],
        nombre: json["nombre"],
        correo: json["correo"],
        direccion: json["direccion"],
        celular: json["celular"],
        archivo: json["archivo"],
        estado: json["estado"],
        observaciones: json["observaciones"],
        soportes: json["soportes"],
        usuario: json["usuario"],
        vigencia: json["vigencia"],
        vencimiento: json["vencimiento"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "codigo": codigo,
        "documento": documento,
        "numero": numero,
        "nombre": nombre,
        "correo": correo,
        "direccion": direccion,
        "celular": celular,
        "archivo": archivo,
        "estado": estado,
        "observaciones": observaciones,
        "soportes": soportes,
        "usuario": usuario,
        "vigencia": vigencia,
        "vencimiento": vencimiento,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
