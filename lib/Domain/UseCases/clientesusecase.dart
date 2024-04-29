
import 'package:proyectomoil/Domain/Models/cliente.dart';
import 'package:proyectomoil/Domain/Repositories/iclientesrepositories.dart';

class ClienteUseCase {
  final IClienteRepository _clienteRepository;

  ClienteUseCase(this._clienteRepository);

  Future<List<Cliente>> getClientes() async {
    return await _clienteRepository.getClientes();
  }



  Future<bool> addCliente(Cliente cliente) async {
    return await _clienteRepository.addCliente(cliente);
  }

  Future<bool> updateCliente(Cliente cliente) async {
    return await _clienteRepository.updateCliente(cliente);
  }

  Future<bool> deleteCliente(int id) async {
    return await _clienteRepository.deleteCliente(id);
  }
}
