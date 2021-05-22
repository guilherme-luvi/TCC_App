import 'dart:convert';
import 'package:http/http.dart';
import 'package:tcc_2021/models/sintoma.dart';
import '../../main.dart';
import '../webclient.dart';

class SintomasWebClient {
  Future<List<Sintoma>> sintomas() async {
    var token = await storage.read(key: "jwt");
    final Response resp = await client.get(
      Uri.https(baseUrl, 'Sintomas'),
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
    final List<Sintoma> sintomas = [];

    for (Map<String, dynamic> element in decodedJson) {
      final sintoma = Sintoma(
        id: element['id'],
        nome: element['nome'],
      );
      sintomas.add(sintoma);
    }
    return sintomas;
  }
}
