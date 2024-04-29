import 'package:proyectomoil/Data/Datasources/Remote/iclientedatasource.dart';
import 'package:proyectomoil/Domain/Models/cliente.dart';
import 'package:proyectomoil/Domain/Repositories/iclientesrepositories.dart';

class ClienteRepository implements IClienteRepository {
  final IClienteDataSource _clienteDataSource;

  ClienteRepository(this._clienteDataSource);

  @override
  Future<List<Cliente>> getClientes() async {
    return await _clienteDataSource.getClientes();
  }

  

  @override
  Future<bool> addCliente(Cliente cliente) async {
    return await _clienteDataSource.addCliente(cliente);
  }

  @override
  Future<bool> updateCliente(Cliente cliente) async {
    return await _clienteDataSource.updateCliente(cliente);
  }

  @override
  Future<bool> deleteCliente(int id) async {
    return await _clienteDataSource.deleteCliente(id);
  }
}
