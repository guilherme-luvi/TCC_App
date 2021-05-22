import 'dart:convert';
import 'package:http/http.dart';
import '../../main.dart';
import '../webclient.dart';

class DiagnosticoWebClient {
  Future<dynamic> gerar(List<int> sintomasIds) async {
    var token = await storage.read(key: "jwt");
    final Response resp = await client
        .post(Uri.https(baseUrl, 'Diagnosticos/gerar'),
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
}