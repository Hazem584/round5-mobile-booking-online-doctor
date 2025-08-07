import 'package:mobile_booking_online_doctor/feature/home/data/models/doctor_model.dart';

abstract class DoctorRemoteDataSource{
  Future<List<DoctorModel>> fetchDoctors();
}