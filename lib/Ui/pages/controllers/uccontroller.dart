import 'package:get/get.dart';

class UcController extends GetxController {
  void goToClients() {
    Get.toNamed('/cliente');
  }

  void goToReports() {
    Get.toNamed('/reporte');
  }

  void goToSupports() {
    Get.toNamed('/soporte');
  }
}
