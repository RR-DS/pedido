import 'dart:convert';
//import 'package:flutter/rendering.dart';

class Produto {
  int? id;
  String nome;
  String sobrenome;
  String cpf;
  //int idade;

  Produto(this.id, this.nome, this.cpf, this.sobrenome);
  Produto.novo(this.nome, this.cpf, this.sobrenome);

  Map<String, dynamic> toMap() {
    return {
      'produto_id': this.id,
      'produto_nome': this.nome,
      'produto_sobrenome': this.sobrenome,
      'produto_cpf': this.cpf,
      //'boi_idade': this.idade
    };
  }

  static Produto fromMap(Map<String, dynamic> map) {
    return Produto(
      map['boi_id'],
      map['boi_nome'],
      map['boi_sobrenome'],
      map['boi_cpf'],
    ); //id, nome, cpf)
  }

  static List<Produto> fromMaps(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return Produto.fromMap(maps[i]);
    });
  }

  static Produto fromJson(String j) => Produto.fromMap(jsonDecode(j));
  static List<Produto> fromJsonList(String j) {
    final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
    return parsed.map<Produto>((map) => Produto.fromMap(map)).toList();
  }

  String toJson() => jsonEncode(toMap());
}
