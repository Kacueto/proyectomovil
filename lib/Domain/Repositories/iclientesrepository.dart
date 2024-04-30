import 'package:proyectomoil/Data/Datasources/Remote/iclientedatasource.dart';
import 'package:proyectomoil/Domain/Models/cliente.dart';

abstract class IClienteRepository {
  final IClienteDataSource _clienteDataSource;

  IClienteRepository(this._clienteDataSource);

  Future<List<Cliente>> getClientes();

  Future<bool> addCliente(Cliente cliente);
  Future<bool> updateCliente(Cliente cliente);
  Future<bool> deleteCliente(int id);
}
