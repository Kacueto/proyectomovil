
import 'package:proyectomoil/Domain/Models/cliente.dart';

abstract class IClienteDataSource {
  Future<List<Cliente>> getClientes();
  Future<bool> addCliente(Cliente cliente);
  Future<bool> updateCliente(Cliente cliente);
  Future<bool> deleteCliente(int id);
}
