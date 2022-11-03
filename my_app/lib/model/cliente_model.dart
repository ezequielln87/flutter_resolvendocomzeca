import 'dart:convert';

List<ClienteModel> userModelFromJson(String str) => List<ClienteModel>.from(
    json.decode(str).map((x) => ClienteModel.fromJson(x)));

String userModelToJson(List<ClienteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClienteModel {
  ClienteModel({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.email,
    required this.telefone,
  });

  int id;
  String nome;
  String cpf;
  String email;
  String telefone;

  factory ClienteModel.fromJson(Map<String, dynamic> json) => ClienteModel(
        id: json["id"],
        nome: json["nome"],
        cpf: json["cpf"],
        email: json["email"],
        telefone: json["telefone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "cpf": cpf,
        "email": email,
        "telefone": telefone
      };
}
