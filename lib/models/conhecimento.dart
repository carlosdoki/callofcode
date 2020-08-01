import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class Conhecimento {
  final String nome;
  final String idDB;
  final String rev;
  final int id;

  Conhecimento({this.nome, this.id, this.idDB, this.rev});

  factory Conhecimento.fromMap(Map<String, dynamic> json) {
    return Conhecimento(
      idDB: json['_id'],
      rev: json['_rev'],
      id: json['id'],
      nome: json['nome'],
    );
  }
}

Future<List<Conhecimento>> fetchConhecimento() async {
  final response =
      await http.get('https://helpcare2.mybluemix.net/allconhecimento');
  if (response.statusCode == 200) {
    return parseConhecimento(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

List<Conhecimento> parseConhecimento(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<Conhecimento>((json) => Conhecimento.fromMap(json))
      .toList();
}
