import 'package:get/get.dart';

class ClientesController extends GetxController {
  RxMap<String, String> clientes = RxMap<String, String>({
    '1': 'Cliente 1',
    '2': 'Cliente 2',
    '3': 'Cliente 3',
  });

  RxString selectedCliente = 'Cliente 1'.obs;
  RxString selectedIdCliente = '1'.obs;

  void addCliente(String id, String nombre) {
    clientes[id] = nombre;
  }
  void editCliente(String id, String nombre) {
    clientes[id] = nombre;
  }
  void deleteCliente(String id) {
    clientes.remove(id);
  }
}
