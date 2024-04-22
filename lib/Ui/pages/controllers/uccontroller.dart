import 'package:get/get.dart';

class UcController extends GetxController {
  void goToClients() {
    Get.toNamed('/clientes');
  }

  void goToReports() {
    Get.toNamed('/reportes');
  }

  void goToSupports() {
    Get.toNamed('/soportes');
  }
}
