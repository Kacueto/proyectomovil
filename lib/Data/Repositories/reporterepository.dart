import '../../Domain/Models/reporte.dart';
import '../../Domain/Repositories/ireporterepository.dart';
import '../Datasources/Remote/ireportedatasource.dart';

class ReporteRepository implements IReporteRepository {
  final IReporteDataSource _reporteDataSource;

  ReporteRepository(this._reporteDataSource);

  @override
  Future<List<Reporte>> getReportes() async {
    return await _reporteDataSource.getReportes();
  }

  @override
  Future<bool> addReporte(Reporte reporte) async {
    return await _reporteDataSource.addReporte(reporte);
  }

  @override
  Future<bool> updateReporte(Reporte reporte) async {
    return await _reporteDataSource.updateReporte(reporte);
  }

  @override
  Future<bool> deleteReporte(int id) async {
    return await _reporteDataSource.deleteReporte(id);
  }
}