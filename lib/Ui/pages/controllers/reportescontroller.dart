import 'package:get/get.dart';
import '../../../Domain/Models/reporte.dart';
import '../../../Domain/UseCases/reporteusecase.dart';

class ReporteController extends GetxController{
  final RxList<Reporte> _reportesList = <Reporte>[].obs;
  final ReporteUseCase reporteUseCase = Get.find();

  List<Reporte> get reportesList => _reportesList;

  @override
  void onInit() {
    getReportes();
    super.onInit();
  }

  getReportes() async {
    _reportesList.value = await reporteUseCase.getReportes();
    _reportesList.value = _reportesList.skip(1).toList();
  }


  int firstIdEmpty() {
    List<Reporte> sortedReportes = reportesList;
    sortedReportes.sort((a, b) => a.id.compareTo(b.id));

    for (int i = 0; i < sortedReportes.length - 1; i++) {
      if (sortedReportes[i].id + 1 != sortedReportes[i + 1].id) {
        return sortedReportes[i].id + 1;
      }
    }

    return sortedReportes.last.id + 1;
  }

  addReporte(Reporte reporte) async {
    await reporteUseCase.addReporte(reporte);
    getReportes();
  }

  updateReporte(Reporte reporte) async {
    await reporteUseCase.updateReporte(reporte);
    getReportes();
  }

  void deleteReporte(int id) async {
    await reporteUseCase.deleteReporte(id);
    getReportes();
  }

  
}