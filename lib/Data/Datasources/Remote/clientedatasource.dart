import 'dart:convert';
import 'package:loggy/loggy.dart';
import 'package:proyectomoil/Data/Datasources/Remote/iclientedatasource.dart';
import 'package:http/http.dart' as http;
import 'package:proyectomoil/Domain/Models/cliente.dart';

class ClienteDataSource implements IClienteDataSource {
  final http.Client httpCliente;
  final String apikey = '';

  ClienteDataSource({http.Client? httpCliente})
      : httpCliente = httpCliente ?? http.Client();

  @override
  Future<List<Cliente>> getClientes() async {
    List<Cliente> clientes = [];
    var request = Uri.parse(url)
        .resolveUri(Uri(queryParameters: {
      "format": "json",
    }));
    var response = await httpCliente.get(request);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      clientes = List<Cliente>.from(data.map((i) => Cliente.fromJson(i)));
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.error('error code $response.statusCode');
    }
    return Future.value(clientes);
  }

  @override
  Future<bool> addCliente(Cliente cliente) async {
    logInfo("Adding cliente $cliente");

    final response = await httpCliente.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(cliente.toJson()),
    );
    if (response.statusCode == 201) {
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }
}
