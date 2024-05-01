import 'dart:convert';

import 'package:loggy/loggy.dart';
import 'package:proyectomoil/Data/Datasources/Remote/ireportedatasource.dart';
import 'package:http/http.dart' as http;

import '../../../Domain/Models/reporte.dart';
class ReporteDataSource implements IReporteDataSource{
  final http.Client httpReporte;
  final String apikey = 'jIlCBd';
  //https://retoolapi.dev/jIlCBd/data

  ReporteDataSource({http.Client? httpReporte})
      : httpReporte = httpReporte ?? http.Client();

  @override
  Future<List<Reporte>> getReportes() async {
    List<Reporte> reportes = [];
    var request = Uri.parse('https://retoolapi.dev/$apikey/data')
        .resolveUri(Uri(queryParameters: {
      "format": "json",
    }));
    var response = await httpReporte.get(request);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      reportes = List<Reporte>.from(data.map((i) => Reporte.fromJson(i)));
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('error code $response.statusCode');
    }
    return Future.value(reportes);
  }

  @override
  Future<bool> addReporte(Reporte reporte) async {
    logInfo("Adding reporte $reporte");

    final response = await httpReporte.post(
      Uri.parse('https://retoolapi.dev/$apikey/data'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(reporte.toJson()),
    );
    if (response.statusCode == 201) {
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  @override
  Future<bool> updateReporte(Reporte reporte) async {
    final response = await httpReporte.put(
      Uri.parse('https://retoolapi.dev/$apikey/data/${reporte.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(reporte.toJson()),
    );
    if (response.statusCode == 200) {
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  @override
  Future<bool> deleteReporte(int id) async {
    final response = await httpReporte.delete(
      Uri.parse('https://retoolapi.dev/$apikey/data/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }


}