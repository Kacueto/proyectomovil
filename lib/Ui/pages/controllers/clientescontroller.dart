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

  //RxString selectedCliente = 'Cliente 1'.obs;
  //RxString selectedIdCliente = '1'.obs;
  //RxMap<String, String> clientes = RxMap<String, String>({
  // '1': 'Cliente 1',
  //'2': 'Cliente 2',
  //'3': 'Cliente 3',
  //});
  //void addCliente1(String id, String nombre) {
  // clientes[id] = nombre;
  //}

  //void editCliente1(String id, String nombre) {
  //clientes[id] = nombre;
  //}

  //void deleteCliente1(String id) {
  //clientes.remove(id);
  //}
}
