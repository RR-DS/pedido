import 'dart:convert';
//import 'package:flutter/rendering.dart';

class Pedido {
  int? id;
  String nome;
  String sobrenome;
  String cpf;
  //int idade;

  Pedido(this.id, this.nome, this.cpf, this.sobrenome);
  Pedido.novo(this.nome, this.cpf, this.sobrenome);

  Map<String, dynamic> toMap() {
    return {
      'pedido_id': this.id,
      'pedido_nome': this.nome,
      'pedido_sobrenome': this.sobrenome,
      'pedido_cpf': this.cpf,
      //'boi_idade': this.idade
    };
  }

  static Pedido fromMap(Map<String, dynamic> map) {
    return Pedido(
      map['boi_id'],
      map['boi_nome'],
      map['boi_sobrenome'],
      map['boi_cpf'],
    ); //id, nome, cpf)
  }

  static List<Pedido> fromMaps(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return Pedido.fromMap(maps[i]);
    });
  }

  static Pedido fromJson(String j) => Pedido.fromMap(jsonDecode(j));
  static List<Pedido> fromJsonList(String j) {
    final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
    return parsed.map<Pedido>((map) => Pedido.fromMap(map)).toList();
  }

  String toJson() => jsonEncode(toMap());
}
