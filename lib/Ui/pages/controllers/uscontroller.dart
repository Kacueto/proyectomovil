import 'package:get/get.dart';

class UsController extends GetxController {
  RxString selectedReport = 'Reporte 1'.obs;
  
  RxString report = ''.obs;

  RxList<String> reportes = RxList([
    'Reporte 1',
    'Reporte 2',
    'Reporte 3',
    'Reporte 4',
    'Reporte 5',
    'Reporte 6',
  ]);

  void goToreport(report) {
    selectedReport.value = report;
    Get.toNamed(
      '/report',
    );
  }

  void selectCliente(String newValue) {}

  void generateReport() {}
}
