import 'package:get/get.dart';

class SoportesController extends GetxController {
  RxMap<String, List<String>> soportes = RxMap<String, List<String>>({
    '1': ['Soporte 1', '1', '2'],
    '2': ['Soporte 2', 'soporte2@example.com', 'clave2'],
    '3': ['Soporte 3', 'soporte3@example.com', 'clave3'],
  });
  
  void addSoporte(String id, List<String> soporte) {
    soportes[id] = soporte;
  }
  void removeSoporte(String id) {
    soportes.remove(id);
  }
  void updateSoporte(String id, List<String> soporte) {
    soportes[id] = soporte;
  }
}
