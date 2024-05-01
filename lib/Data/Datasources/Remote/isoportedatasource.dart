
import '../../../Domain/Models/soporte.dart';

abstract class ISoporteDataSource {
  Future<List<Soporte>> getSoportes();
  Future<bool> addSoporte(Soporte Soporte);
  Future<bool> updateSoporte(Soporte Soporte);
  Future<bool> deleteSoporte(int id);
}