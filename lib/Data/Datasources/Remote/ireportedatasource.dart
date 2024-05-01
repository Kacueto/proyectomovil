
import '../../../Domain/Models/reporte.dart';

abstract class IReporteDataSource {
  Future<List<Reporte>> getReportes();
  Future<bool> addReporte(Reporte reporte);
  Future<bool> updateReporte(Reporte reporte);
  Future<bool> deleteReporte(int id);
}