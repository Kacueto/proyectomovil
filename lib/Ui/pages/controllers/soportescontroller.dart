import 'package:get/get.dart';

import '../../../Domain/Models/soporte.dart';
import '../../../Domain/UseCases/soporteusecase.dart';

class SoportesController extends GetxController {
  final RxList<Soporte> _soportesList = <Soporte>[].obs;
  final SoporteUseCase soporteUseCase = Get.find();

  List<Soporte> get soportesList => _soportesList;

  @override
  void onInit() {
    getSoportes();
    super.onInit();
  }

  getSoportes() async {
    _soportesList.value = await soporteUseCase.getSoportes();
  }

  int firstIdEmpty() {
    List<Soporte> sortedSoportes = soportesList;
    sortedSoportes.sort((a, b) => a.id.compareTo(b.id));

    for (int i = 0; i < sortedSoportes.length - 1; i++) {
      if (sortedSoportes[i].id + 1 != sortedSoportes[i + 1].id) {
        return sortedSoportes[i].id + 1;
      }
    }

    return sortedSoportes.last.id + 1;
  }

  addSoporte(Soporte soporte) async {
    await soporteUseCase.addSoporte(soporte);
    getSoportes();
  }

  updateSoporte(Soporte soporte) async {
    await soporteUseCase.updateSoporte(soporte);
    getSoportes();
  }

  void deleteSoporte(int id) async {
    await soporteUseCase.deleteSoporte(id);
    getSoportes();
  }

  
}
