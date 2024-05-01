import 'package:proyectomoil/Domain/Repositories/isoportesrepository.dart';
import '../../Domain/Models/soporte.dart';
import '../Datasources/Remote/isoportedatasource.dart';

class SoporteRepository implements ISoporteRepository {
  final ISoporteDataSource _soporteDataSource;

  SoporteRepository(this._soporteDataSource);

  @override
  Future<List<Soporte>> getSoportes() async {
    return await _soporteDataSource.getSoportes();
  }

  @override
  Future<bool> addSoporte(Soporte soporte) async {
    return await _soporteDataSource.addSoporte(soporte);
  }

  @override
  Future<bool> updateSoporte(Soporte soporte) async {
    return await _soporteDataSource.updateSoporte(soporte);
  }

  @override
  Future<bool> deleteSoporte(int id) async {
    return await _soporteDataSource.deleteSoporte(id);
  }
}