import '../Models/soporte.dart';
import '../Repositories/isoportesrepository.dart';

class SoporteUseCase{
  final ISoporteRepository _soporteRepository;

  SoporteUseCase(this._soporteRepository);
  
  Future<List<Soporte>> getSoportes() async {
    return await _soporteRepository.getSoportes();
  }

  Future<bool> addSoporte(Soporte soporte) async {
    return await _soporteRepository.addSoporte(soporte);
  }

  Future<bool> updateSoporte(Soporte soporte) async {
    return await _soporteRepository.updateSoporte(soporte);
  }

  Future<bool> deleteSoporte(int id) async {
    return await _soporteRepository.deleteSoporte(id);
  }

  
}