import 'dart:convert';
import 'package:http/http.dart';
import 'package:tcc_2021/models/doenca.dart';
import '../../main.dart';
import '../webclient.dart';

class DoencasWebClient {
  Future<Doenca> doenca(int doencaId) async {
    var token = await storage.read(key: "jwt");
    final Response resp = await client.get(
      Uri.https(baseUrl, 'api/Doencas/$doencaId'),
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
    final doenca = Doenca(
      id: decodedJson['id'],
      nome: decodedJson['nome'],
      descricao: decodedJson['descricao'],
    );

    return doenca;
  }
}
