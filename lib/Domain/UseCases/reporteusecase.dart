import '../Models/reporte.dart';
import '../Repositories/ireporterepository.dart';

class ReporteUseCase {
  final IReporteRepository _reporteRepository;

  ReporteUseCase(this._reporteRepository);

  Future<List<Reporte>> getReportes() async {
    return await _reporteRepository.getReportes();
  }

  Future<bool> addReporte(Reporte reporte) async {
    return await _reporteRepository.addReporte(reporte);
  }

  Future<bool> updateReporte(Reporte reporte) async {
    return await _reporteRepository.updateReporte(reporte);
  }

  Future<bool> deleteReporte(int id) async {
    return await _reporteRepository.deleteReporte(id);
  }
}