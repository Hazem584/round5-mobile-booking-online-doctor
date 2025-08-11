
import '../models/doctor_model.dart';

abstract class DoctorRemoteDataSource{
  Future<List<DoctorModel>> fetchDoctors();
}