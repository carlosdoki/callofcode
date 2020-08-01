import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class Usuario {
  String sId;
  String sRev;
  String name;
  String email;

  Usuario({this.sId, this.sRev, this.name, this.email});

  Usuario.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sRev = json['_rev'];
    name = json['name'];
    email = json['email'];
  }
}

Future<List<Usuario>> fetchUsuario() async {
  final response = await http.get('https://helpcare2.mybluemix.net/allusers');
  if (response.statusCode == 200) {
    return parseUsuario(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

List<Usuario> parseUsuario(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Usuario>((json) => Usuario.fromJson(json)).toList();
}
