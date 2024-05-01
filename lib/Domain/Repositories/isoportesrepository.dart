import 'package:proyectomoil/Data/Datasources/Remote/isoportedatasource.dart';

import '../Models/soporte.dart';

abstract class ISoporteRepository {
  final ISoporteDataSource _soporteDataSource;

  ISoporteRepository(this._soporteDataSource);

  Future<List<Soporte>> getSoportes();

  Future<bool> addSoporte(Soporte soporte);
  Future<bool> updateSoporte(Soporte soporte);
  Future<bool> deleteSoporte(int id);
}