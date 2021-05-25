import 'dart:convert';
import 'package:http/http.dart';
import 'package:tcc_2021/models/diagnostico.dart';
import '../../main.dart';
import '../webclient.dart';

class DiagnosticoWebClient {
  Future<dynamic> gerar(List<int> sintomasIds) async {
    var token = await storage.read(key: "jwt");
    final Response resp = await client
        .post(Uri.https(baseUrl, 'api/Diagnosticos/gerar'),
            headers: {
              'Content-type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: json.encode(
              {
                'sitomasIds': sintomasIds,
              },
            ))
        .timeout(Duration(seconds: 15));

    if (resp.statusCode != 200) {
      return null;
    }

    final decodedJson = jsonDecode(resp.body);
    return decodedJson;
  }

  Future<List<Diagnostico>> meusDiagnosticos() async {
    var token = await storage.read(key: "jwt");
    final Response resp = await client.get(
      Uri.https(baseUrl, 'api/Diagnosticos/meus'),
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
    final List<Diagnostico> diagnosticos = [];

    for (Map<String, dynamic> element in decodedJson) {
      final diagnostico = Diagnostico(
        id: element['id'],
        resultados: element['resultados'],
        data: element['data'],
      );
      diagnosticos.add(diagnostico);
    }
    return diagnosticos;
  }
}
