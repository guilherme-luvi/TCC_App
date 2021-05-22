import 'dart:convert';
import 'package:http/http.dart';
import 'package:tcc_2021/models/token.dart';
import 'package:tcc_2021/models/usuario.dart';
import '../../main.dart';
import '../webclient.dart';

class UserWebClient {
  Future<dynamic> logIn(String email, String senha) async {
    final Response resp = await client
        .post(
          Uri.https(baseUrl, 'api/Usuarios/login'),
          headers: {
            'Content-type': 'application/json',
          },
          body: json.encode({
            'email': email,
            'password': senha,
          }),
        )
        .timeout(Duration(seconds: 15));

    if (resp.statusCode != 200) {
      await storage.deleteAll();
      return null;
    }

    final decodedJson = jsonDecode(resp.body);
    var token = new Token(
      decodedJson['token'],
    );
    await storage.write(key: "jwt", value: token.token);
    await storage.write(key: "email", value: email);
    await storage.write(key: "senha", value: senha);

    return token.token;
  }

  Future<dynamic> signUp(String name, String email, String senha) async {
    final Response resp = await client
        .post(
          Uri.https(baseUrl, 'api/Usuarios/cadastro'),
          headers: {
            'Content-type': 'application/json',
          },
          body: json.encode({
            'nome': name,
            'email': email,
            'senha': senha,
          }),
        )
        .timeout(Duration(seconds: 15));

    if (resp.statusCode != 200) {
      return null;
    }

    final decodedJson = jsonDecode(resp.body);
    return decodedJson;
  }

  Future<Usuario> loggedUser() async {
    var token = await storage.read(key: "jwt");
    final Response resp = await client.get(
      Uri.https(baseUrl, 'api/Usuarios/me'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ).timeout(Duration(seconds: 15));

    if (resp.statusCode != 200) {
      return null;
    }

    final decodedJson = jsonDecode(resp.body);
    final user = Usuario(
      decodedJson['id'],
      decodedJson['name'],
      decodedJson['email'],
    );
    return user;
  }
}
