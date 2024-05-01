
import 'package:proyectomoil/Data/Datasources/Remote/isoportedatasource.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../Domain/Models/soporte.dart';

class SoporteDataSource implements ISoporteDataSource{
  final http.Client httpSoporte;
  final String apikey = 'WlNQtX';

  SoporteDataSource({http.Client? httpSoporte})
      : httpSoporte = httpSoporte ?? http.Client();

  @override
  Future<List<Soporte>> getSoportes() async {
    List<Soporte> soportes = [];
    var request = Uri.parse('https://retoolapi.dev/$apikey/data')
        .resolveUri(Uri(queryParameters: {
      "format": "json",
    }));
    var response = await httpSoporte.get(request);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      soportes = List<Soporte>.from(data.map((i) => Soporte.fromJson(i)));
    } else {
      return Future.error('error code $response.statusCode');
    }
    return Future.value(soportes);
  }

  @override
  Future<bool> addSoporte(Soporte soporte) async {
    final response = await httpSoporte.post(
      Uri.parse('https://retoolapi.dev/$apikey/data'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(soporte.toJson()),
    );
    if (response.statusCode == 201) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Future<bool> updateSoporte(Soporte soporte) async {
    final response = await httpSoporte.put(
      Uri.parse('https://retoolapi.dev/$apikey/data/${soporte.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(soporte.toJson()),
    );
    if (response.statusCode == 200) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override

  Future<bool> deleteSoporte(int id) async {
    final response = await httpSoporte.delete(
      Uri.parse('https://retoolapi.dev/$apikey/data/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

}