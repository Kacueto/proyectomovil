import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:proyectomoil/Domain/Models/cliente.dart';

import '../../../Domain/UseCases/clientesusecase.dart';

class ClientesController extends GetxController {
  final RxList<Cliente> _clientesList = <Cliente>[].obs;
  final ClienteUseCase clienteUseCase = Get.find();

  List<Cliente> get clientesList => _clientesList;

  @override
  void onInit() {
    getClientes();
    super.onInit();
  }

  getClientes() async {
    logInfo('Getting clientes');
    _clientesList.value = await clienteUseCase.getClientes();
  }

  int firstIdEmpty() {
  List<Cliente> sortedClientes = clientesList;
  sortedClientes.sort((a, b) => a.id.compareTo(b.id));

  for (int i = 0; i < sortedClientes.length - 1; i++) {
    if (sortedClientes[i].id + 1 != sortedClientes[i + 1].id) {
      return sortedClientes[i].id + 1;
    }
  }

  return sortedClientes.last.id + 1;
}
 
  addCliente(Cliente cliente) async {
    logInfo('Adding cliente $cliente');
    await clienteUseCase.addCliente(cliente);
    getClientes();
  }

  updateCliente(Cliente cliente) async {
    logInfo('Updating cliente $cliente');
    await clienteUseCase.updateCliente(cliente);
    getClientes();
  }

  void deleteCliente(int id) async {
    logInfo('Deleting cliente $id');
    await clienteUseCase.deleteCliente(id);
    getClientes();
  }

}
