import 'package:online_booking_with_doctor/feature/home/data/models/doctor_model.dart';

abstract class DoctorRemoteDataSource{
  Future<List<DoctorModel>> fetchDoctors();
}