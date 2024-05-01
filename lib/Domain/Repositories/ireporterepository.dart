import '../../Data/Datasources/Remote/ireportedatasource.dart';
import '../Models/reporte.dart';

abstract class IReporteRepository {
  final IReporteDataSource _reporteDataSource;

  IReporteRepository(this._reporteDataSource);

  Future<List<Reporte>> getReportes();

  Future<bool> addReporte(Reporte reporte);
  Future<bool> updateReporte(Reporte reporte);
  Future<bool> deleteReporte(int id);
}